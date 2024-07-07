import 'package:chillpill/PAGES/medicine_details/medicine_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 32)),
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
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 1.h),
          child: Text(
            "00",
            style: TextStyle(
              fontSize: 40.0,
              fontStyle: FontStyle.normal,
              color: Color(0xfff06292),
              fontWeight: FontWeight.bold,
              fontFamily: 'ConcertOne',
            ),
          ),
        )
      ],
    );
  }
}

class Bottomcontainer extends StatelessWidget {
  const Bottomcontainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Center(
      child: Text(
        "No Medicine",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30.0,
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'ConcertOne',
        ),
      ),
    );*/
    return GridView.builder(
      padding: EdgeInsets.only(top: 1.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return MedicineCard();
      },
    );
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: (){
        Get.to(MedicineDetails());

      },
      child: Container(
        padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 1.h,bottom: 1.h),
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(2.h)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/bottle.svg',
              height: 7.h,
              color: Color(0xfff06292),
            ),
            const Spacer(),
            Text(
              'Cal-pol',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            Text(
              'Every 8 hours',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black54, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

