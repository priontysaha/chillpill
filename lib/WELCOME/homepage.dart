import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../PAGES/medicine_type_page.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('',
              style: TextStyle(
                  color: Colors.purple.shade700, fontWeight: FontWeight.w500)),
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
          child: Column(children: [
            Positioned(
              bottom: 400,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "Seamless Remiders,\nHelthier You.",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ConcertOne',
                    ),
                  ),
                  Text(
                    "\nwelcome to take daily dose",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ConcertOne',
                    ),
                  ),
                  Text(
                    "00",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ConcertOne',
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      'No Medicine',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xfff06292),
                        fontFamily: 'ConcertOne',
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
        floatingActionButton: Card(
          color: Colors.pink.shade200,
          child: ElevatedButton(
            onPressed: () {
              Get.to(medicine_type());
            },
            child: Icon(
              Icons.add_outlined,
            ),
          ),
        ));
  }
}
