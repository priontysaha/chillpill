import 'package:chillpill/PAGES/new_entry_bloc.dart';
import 'package:chillpill/firebase_options.dart';
import 'package:chillpill/global_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'WELCOME/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
        value: globalBloc!,
        child: Sizer(builder: (context, oreientation, devicetype) {
          return GetMaterialApp(
            theme: ThemeData(
              textTheme: TextTheme(
                labelMedium: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xfff06292),
                ),
                headlineMedium: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(0xfff06292),
                ),
                bodySmall: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(0xfff06292),
                ),
                headlineLarge:  TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(0xfff06292),
                ),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xfffce4ec),
                    width: 0.7,
                  )),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xfffce4ec),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xfffce4ec),
                  ))),
            ),
            home: splashscreen(),
          );
        }));
  }
}
