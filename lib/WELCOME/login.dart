
import 'package:chillpill/WELCOME/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
            style: TextStyle(
                color: Colors.purple.shade700,
                fontWeight: FontWeight.w500
            )
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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

        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter E-mail',
                suffixIcon: Icon(Icons.alternate_email_rounded),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Password',
                suffixIcon: Icon(Icons.password_outlined),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: () {
                  Get.to(login());
                },
                child: Text("Log In", style: TextStyle(fontSize: 20.0),)
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 25,
              child: GestureDetector(
                onTap: () {
                  Get.to(registration());
                },
                child: Text('Create new account', style: TextStyle(
                    fontSize:20.00,fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )


            /*OutlinedButton(
                  onPressed:(){
                    Get.to(Registration());
                  },
                  child: Text('Don\'t have an account?')
              )*/
            )],
        ),
      ),
    );
  }
}
