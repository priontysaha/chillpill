import 'package:chillpill/PAGES/medicine_details/medicine_details.dart';
import 'package:chillpill/global_bloc.dart';
import 'package:chillpill/models/medicine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../PAGES/medicine_type_page.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ChillPill',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 32)),
        backgroundColor: Colors.deepPurple,
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
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            Topcontainer(),
            SizedBox(
              height: 2.h,
            ),
            Flexible(child: Bottomcontainer()),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          Get.to(medicine_type());
        },
        child: SizedBox(
          width: 18.w,
          height: 9.h,
          child: Card(
            color: Color(0xfff06292),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(3.h),
            ),
            child: Icon(
              Icons.add_outlined,
              color: Colors.white,
              size: 50.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class Topcontainer extends StatelessWidget {
  const Topcontainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            "Seamless Remiders,\nHelthier You.",
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.normal,
              color: Color(0xfff06292),
              fontWeight: FontWeight.bold,
              fontFamily: 'ConcertOne',
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(bottom: 1.h),
          child: Text(
            "\nwelcome to take daily dose",
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              color: Color(0xfff06292),
              fontWeight: FontWeight.bold,
              fontFamily: 'ConcertOne',
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        StreamBuilder<List<Medicine>>(
          stream: globalBloc.medicineList$,
          builder: (context, snapshot) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 1.h),
              child: Text(
                !snapshot.hasData ? '0' : snapshot.data!.length.toString(),
                style: TextStyle(
                  fontSize: 40.0,
                  fontStyle: FontStyle.normal,
                  color: Color(0xfff06292),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ConcertOne',
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class Bottomcontainer extends StatelessWidget {
  const Bottomcontainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);

    return StreamBuilder(
      stream: globalBloc.medicineList$,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else if (snapshot.data!.isEmpty) {
          return Center(
              child: Text(
            'No Medicine',
          ));
        } else {
          return GridView.builder(
            padding: EdgeInsets.only(top: 1.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MedicineCard(medicine: snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key, required this.medicine});
  final Medicine medicine;

  Hero makeIcon(double size) {
    if (medicine.medicineType == 'Bottle') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/bottle.svg',
          color: Color(0xfff06292),
          height: 7.h,
        ),
      );
    } else if ((medicine.medicineType == 'Pill')) {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/pill.svg',
          color: Color(0xfff06292),
          height: 7.h,
        ),
      );
    } else if ((medicine.medicineType == 'Syringe')) {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/syringe.svg',
          color: Color(0xfff06292),
          height: 7.h,
        ),
      );
    } else if ((medicine.medicineType == 'Tablet')) {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: SvgPicture.asset(
          'assets/tablet.svg',
          color: Color(0xfff06292),
          height: 7.h,
        ),
      );
    }
    return Hero(
      tag: medicine.medicineName! + medicine.medicineType!,
      child: Icon(
        Icons.error,
        color: Color(0xfff06292),
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder<void>(pageBuilder:
            (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
              animation: animation,
              builder: (context, Widget? child) {
                return Opacity(
                  opacity: animation.value,
                  child: MedicineDetails(medicine),
                );
              },);
        },
          transitionDuration: const Duration(milliseconds: 500),
        ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 1.h),
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(2.h)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            makeIcon(7.h),
            const Spacer(),
            Hero(
              tag: medicine.medicineName!,
              child: Text(
                medicine.medicineName!,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(
              height: 0.3.h,
            ),
            Text(
              medicine.interval == 1
                  ? "Every ${medicine.interval} hour"
                  : "Every ${medicine.interval} hour",
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
