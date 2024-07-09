import 'dart:async';

import 'package:chillpill/WELCOME/homepage.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2200), () {
      Get.to(homepage());
    });
  }

  Widget build(BuildContext context) {
    return Material(
        color: Color(0xfffce4ec),
        child: Center(
          child: Image(
            image: AssetImage('assets/check.png'),
          ),
        ));
  }
}
