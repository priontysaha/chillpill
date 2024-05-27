
import 'package:flutter/material.dart';

class registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration',
            style: TextStyle(color: Colors.purple.shade700, fontWeight: FontWeight.w500)),
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
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter First  Name',
                  suffixIcon: Icon(Icons.account_circle_rounded),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter Last Name',
                  suffixIcon: Icon(Icons.account_circle_rounded),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter E-mail',
                  suffixIcon: Icon(Icons.alternate_email_rounded),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter Password',
                  suffixIcon: Icon(Icons.password_outlined),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  print("pp");
                },
                child: Text('Register',style: TextStyle(fontSize: 20.0),)),
          ],
        ),
      ),
    );
  }
}
