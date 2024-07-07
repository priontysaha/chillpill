
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chillpill/WELCOME/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../User auth/Firebase_auth_implementation/firebase_auth_services.dart';
import 'homepage.dart';

class login extends StatefulWidget {
  const login({super.key});


  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();


    super.dispose();
  }
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
                  Color(0xfff8bbd0),
                  Color(0xfffce4ec,
                      )

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
              controller: _emailController,
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
              controller: _passwordController,
              obscureText: true,
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
                onPressed: _signIn,
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

  Future _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    UserCredential? cred = await _auth.signInWithEmailAndPassword(email: email, password: password);

    User? user = cred.user;
    if(user != null){
      print("User is successfully signedIn");
      //Navigator.pushNamed(context, "/home");
      Get.offAll(homepage());
    }
    else
      print("Some error happened");
  }

}
