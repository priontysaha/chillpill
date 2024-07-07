import 'package:chillpill/WELCOME/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class registration extends StatefulWidget {
  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration',
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
                  Color(
                    0xfffce4ec,
                  )
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _firstnameController,
              decoration: InputDecoration(
                  labelText: 'Enter First Name',
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
              controller: _lastnameController,
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
              controller: _emailController,
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
              obscureText: true,
              controller: _passwordController,
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
                onPressed: _signUp,
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20.0),
                )),
          ],
        ),
      ),
    );
  }

  Future _signUp() async {
    String firstname = _firstnameController.text;
    String lastname = _lastnameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    UserCredential? cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    User? user = cred.user;
    if (user != null) {
      print("User is successfully created");
      //Navigator.pushNamed(context, "/home");
      Get.offAll(homepage());
    } else
      print("Some error happened");
  }
}
