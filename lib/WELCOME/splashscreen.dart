import 'dart:async';

import 'package:chillpill/WELCOME/welcomepage1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {


  @override
  void initState() {
    Timer(const Duration(seconds:2), () {
      Get.to(Welcome());

    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor:Color(0xfffce4ec),
        body: Center(
          child: Hero(
              tag: "Logo",
              child: Text("ChillPill",
                style: TextStyle(
                    fontSize: 65.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'ConcertOne',
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.transparent
                ),
            )
        ),
      )
    );
  }
}
