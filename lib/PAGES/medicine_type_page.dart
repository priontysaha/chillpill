import 'dart:math';
import 'dart:async';

import 'package:chillpill/PAGES/new_entry_bloc.dart';
import 'package:chillpill/PAGES/success_screen/success_screen.dart';
import 'package:chillpill/WELCOME/homepage.dart';
import 'package:chillpill/common/convert_time.dart';
import 'package:chillpill/global_bloc.dart';
import 'package:chillpill/models/errors.dart';
import 'package:chillpill/models/medicine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/medicine_type.dart';

class medicine_type extends StatefulWidget {
  const medicine_type({super.key});

  @override
  State<medicine_type> createState() => _medicine_typeState();
}

class _medicine_typeState extends State<medicine_type> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late NewEntryBloc _newEntryBloc;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    _newEntryBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _newEntryBloc = NewEntryBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    initializeNotification();
    initializeErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Add New',
              style: TextStyle(
                  color: Colors.purple.shade700, fontWeight: FontWeight.w500)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xfff8bbd0),
                    Color(0xfffce4ec),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
          padding: EdgeInsets.all(1.0),
          child: Provider<NewEntryBloc>.value(
            value: _newEntryBloc,
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PanelTitle(
                      title: 'Medicine Name',
                      isRequired: true,
                    ),
                    TextFormField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    const PanelTitle(
                      title: 'Dosage in mg',
                      isRequired: true,
                    ),
                    TextFormField(
                      controller: dosageController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const PanelTitle(title: 'Medicine Type', isRequired: false),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: StreamBuilder<MedicineType>(
                          stream: _newEntryBloc.selectedMedicineType,
                          builder: (context, snapshot) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MedicineTypeColumn(
                                    medicineType: MedicineType.Pill,
                                    name: 'Pill',
                                    iconValue: 'assets/pill.svg',
                                    isSelected:
                                        snapshot.data == MedicineType.Pill
                                            ? true
                                            : false),
                                MedicineTypeColumn(
                                    medicineType: MedicineType.Bottle,
                                    name: 'Bottle',
                                    iconValue: 'assets/bottle.svg',
                                    isSelected:
                                        snapshot.data == MedicineType.Bottle
                                            ? true
                                            : false),
                                MedicineTypeColumn(
                                    medicineType: MedicineType.Syringe,
                                    name: 'Syringe',
                                    iconValue: 'assets/syringe.svg',
                                    isSelected:
                                        snapshot.data == MedicineType.Syringe
                                            ? true
                                            : false),
                                MedicineTypeColumn(
                                    medicineType: MedicineType.Tablet,
                                    name: 'Tablet',
                                    iconValue: 'assets/tablet.svg',
                                    isSelected:
                                        snapshot.data == MedicineType.Tablet
                                            ? true
                                            : false),
                              ],
                            );
                          }),
                    ),
                    const PanelTitle(
                        title: 'Interval Selection', isRequired: true),
                    const IntervalSelection(),
                    const PanelTitle(title: 'Starting Time', isRequired: true),
                    const SelectTime(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.w,
                        right: 8.w,
                      ),
                      child: SizedBox(
                        height: 8.h,
                        width: 80.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xfff06292),
                            shape: const StadiumBorder(),
                          ),
                          child: Center(
                            child: Text('Confirm',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    )),
                          ),
                          onPressed: () {
                            String? medicineName;
                            int? dosage;

                            if (nameController.text == "") {
                              _newEntryBloc.submitError(EntryError.nameNull);
                              return;
                            }
                            if (nameController.text != "") {
                              medicineName = nameController.text;
                            }
                            if (dosageController.text == "") {
                              dosage = 0;
                            }
                            if (dosageController.text != "") {
                              dosage = int.parse(dosageController.text);
                            }
                            for (var medicine
                                in globalBloc.medicineList$!.value) {
                              if (medicineName == medicine.medicineName) {
                                _newEntryBloc
                                    .submitError(EntryError.nameDuplicate);
                                return;
                              }
                            }
                            if (_newEntryBloc.selectIntervals!.value == 0) {
                              _newEntryBloc.submitError(EntryError.interval);
                              return;
                            }
                            if (_newEntryBloc.selectedTimeOfDay$!.value ==
                                'Name') {
                              _newEntryBloc.submitError(EntryError.startTime);
                              return;
                            }

                            String medicineType = _newEntryBloc
                                .selectedMedicineType!.value
                                .toString()
                                .substring(13);

                            int interval = _newEntryBloc.selectIntervals!.value;
                            String startTime =
                                _newEntryBloc.selectedTimeOfDay$!.value;

                            List<int> intIDs = makeIDs(
                                24 / _newEntryBloc.selectIntervals!.value);
                            List<String> notificationIDs =
                                intIDs.map((i) => i.toString()).toList();

                            Medicine newEntryMedicine = Medicine(
                                notificationIDs: notificationIDs,
                                medicineName: medicineName,
                                dosage: dosage,
                                medicineType: medicineType,
                                interval: interval,
                                startTime: startTime);
                            globalBloc.updateMedicineList(newEntryMedicine);

                            scheduleNotification(newEntryMedicine);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessScreen()));

                            //Get.to(SuccessScreen());
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }

  void initializeErrorListen() {
    _newEntryBloc.errorState$!.listen((EntryError error) {
      switch (error) {
        case EntryError.nameNull:
          displayError("Please enter the medicine's name");
          break;

        case EntryError.nameDuplicate:
          displayError("Medicine name already exists");
          break;

        case EntryError.dosage:
          displayError("Please enter the dosage required");
          break;

        case EntryError.interval:
          displayError("Please select the reminder's interval");
          break;

        case EntryError.startTime:
          displayError("Please select the reminder's starting time");
          break;
        default:
      }
    });
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Color(0xfff06292),
      duration: const Duration(milliseconds: 2000),
    ));
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  initializeNotification() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/launcher_icon');

    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const homepage()));
  }

  Future<void> scheduleNotification(Medicine medicine) async {
    var hour = int.parse(medicine.startTime![0] + medicine.startTime![1]);
    var ogValue = hour;
    var minute = int.parse(medicine.startTime![2] + medicine.startTime![3]);

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'repeatDailyAtTime channel id', 'repeatDailyAtTime channel name',
        importance: Importance.max,
        ledColor: Colors.purpleAccent,
        ledOffMs: 1000,
        ledOnMs: 1000,
        enableLights: true);

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    for (int i = 0; i < (24 / medicine.interval!).floor(); i++) {
      if (hour + (medicine.interval! * i) > 23) {
        hour = hour + (medicine.interval! * i) - 24;
      } else {
        hour = hour + (medicine.interval! * i);
      }
      await flutterLocalNotificationsPlugin.periodicallyShowWithDuration(
          int.parse(medicine.notificationIDs![i]),
          'Reminder: ${medicine.medicineName}',
          medicine.medicineType.toString() != MedicineType.None.toString()
              ? 'It is time to take your ${medicine.medicineType!.toLowerCase()}, according to schedule'
              : 'It is time to take your medicine according to schedule',
          Duration(hours: hour,minutes:  minute),
          platformChannelSpecifics);
      hour = ogValue;
    }
  }
}

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay> _selectTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
      });
    }
    return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color(0xfff06292), shape: const StadiumBorder()),
          onPressed: () {
            _selectTime();
          },
          child: Center(
            child: Text(
              _clicked == false
                  ? "Select Time"
                  : "${convertTime(_time.hour.toString())} : ${convertTime(_time.minute.toString())}",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class IntervalSelection extends StatefulWidget {
  const IntervalSelection({super.key});

  @override
  State<IntervalSelection> createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;
  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Remind me every',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          DropdownButton(
            iconEnabledColor: Colors.pinkAccent,
            dropdownColor: Colors.white,
            itemHeight: 8.h,
            hint: _selected == 0
                ? Text(
                    'Select an Interval',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        // fontFamily: 'ConcertOne',
                        color: Color(0xfff06292)),
                  )
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(
                () {
                  _selected = newVal!;
                  newEntryBloc.updateInterval(newVal);
                },
              );
            },
          ),
          Text(
            _selected == 1 ? " hour" : " hours",
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}

class MedicineTypeColumn extends StatelessWidget {
  const MedicineTypeColumn(
      {Key? key,
      required this.medicineType,
      required this.name,
      required this.iconValue,
      required this.isSelected})
      : super(key: key);
  final MedicineType medicineType;
  final String name;
  final String iconValue;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return GestureDetector(
      onTap: () {
        newEntryBloc.updateSelectedMedicine(medicineType);
      },
      child: Column(
        children: [
          Container(
            width: 20.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.h),
              color: isSelected ? kDefaultIconLightColor : Color(0xfff06292),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 1.h,
                  bottom: 1.h,
                ),
                child: SvgPicture.asset(
                  iconValue,
                  height: 7.h,
                  color: isSelected ? Colors.black87 : Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 20.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Color(0xfff06292),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: kDefaultIconLightColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text.rich(TextSpan(children: <TextSpan>[
        TextSpan(
          text: title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        TextSpan(
          text: isRequired ? "*" : "",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Color(0xfff06292),
              ),
        )
      ])),
    );
  }
}
