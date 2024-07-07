import 'dart:async';

import 'package:chillpill/WELCOME/homepage.dart';
import 'package:chillpill/WELCOME/welcomepage1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

bool loggedIn = false;

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {




      if (loggedIn == true) {
        Get.offAll(homepage());
      } else {
        Get.offAll(Welcome());
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffce4ec),
        body: Center(
          child: Hero(
              tag: "Logo",
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    loggedIn = true;
                  }
                  return const Text(
                    "ChillPill",
                    style: TextStyle(
                        fontSize: 65.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'ConcertOne',
                        color: Color(0xfff06292),
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.transparent),
                  );
                },
              )),
        ));
  }
}
