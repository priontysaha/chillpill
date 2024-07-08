import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key});

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Details',
              style: TextStyle(
                  color: Colors.purple.shade700, fontWeight: FontWeight.w500)),
        ),
        backgroundColor: Colors.white,
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
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              MainSection(),
              ExtendedSection(),
              Spacer(),
              SizedBox(
                width: 100.w,
                height: 7.h,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xfff06292),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      openAlertBox(context);
                    },
                    child: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Color(0xfffce4ec),
                            fontWeight: FontWeight.w800,
                          ),
                    )),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  openAlertBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )),
          contentPadding: EdgeInsets.only(top: 1.h),
          title: Text(
            'Delete This Reminder?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Color(0xfff06292),
              fontWeight: FontWeight.w500,
                ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Ok',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.purple.shade400,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/bottle.svg',
          height: 10.h,
          color: Color(0xfff06292),
        ),
        SizedBox(
          width: 2.w,
        ),
        Column(
          children: const [
            MainInfoTab(fieldTitle: 'Medicine Name', fieldInfo: 'Catapol'),
            MainInfoTab(fieldTitle: 'Dosage', fieldInfo: '500 mg'),
          ],
        )
      ],
    );
  }
}

class MainInfoTab extends StatelessWidget {
  const MainInfoTab(
      {super.key, required this.fieldTitle, required this.fieldInfo});

  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 10.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Color(0xfff06292),
                  ),
            ),
            Text(
              fieldInfo,
              style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        ),
      ),
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ExtendedInfoTab(
          fieldTitle: 'Medicine Type',
          fieldInfo: 'Pill',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Dosage Intervals',
          fieldInfo: 'Every 8 hours | 3 times a day',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Start Time',
          fieldInfo: '01:19',
        ),
      ],
    );
  }
}

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab(
      {super.key, required this.fieldTitle, required this.fieldInfo});

  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(
              fieldTitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black54,
                  ),
            ),
          ),
          Text(
            fieldInfo,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Color(0xfff06292),
                ),
          )
        ],
      ),
    );
  }
}
