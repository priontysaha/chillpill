

import 'package:chillpill/WELCOME/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors:[
                Color(0xffff4590),
                Color(0xff382743,)

              ],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          stops: [0.0,1.0],
          tileMode: TileMode.clamp)
          ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                  bottom: 350,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text( "Take a ChillPill",
            style: TextStyle(
            fontSize: 30.0,
            fontStyle: FontStyle.normal   ,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),)
                    ],
                  ),),
              Positioned(
                  bottom:100,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: GestureDetector(
                      onTap: (){
                       Get.to(login());

                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                          child: Text('Login',style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),

                      ),
                    ),
                  ))



            ],
          ),
        ),
        ),
      );
  }

}