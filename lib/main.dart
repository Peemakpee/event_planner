import 'dart:async';

import 'package:event_planner/dashboard.dart';

import 'package:event_planner/firebase_options.dart';
import 'package:event_planner/homepage.dart';
import 'package:event_planner/logind.dart';

import 'package:event_planner/loginpage.dart';
import 'package:event_planner/register.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'new.dart';

/*
void main() {
  runApp(MyApp());
}
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: New(),
      // HomePage(),
    );
  }
}

class Mysplashscreen extends StatefulWidget {
  const Mysplashscreen({super.key});

  @override
  _MysplashscreenState createState() => _MysplashscreenState();
}

class _MysplashscreenState extends State<Mysplashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 193, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/party.png',
              height: 200,
              width: 200,
            ),
            const Text(
              'Diwang',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poor Story',
                color: Color.fromARGB(255, 108, 60, 153),
              ),
            ),
            const Text(
              'An Event Planning App',
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Poor Story',
                color: Color.fromARGB(255, 108, 60, 153),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
