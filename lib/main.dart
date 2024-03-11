import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferencestask/login_page.dart';
import 'package:sharedpreferencestask/logout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? loggined;
  bool? logouted;
  @override
  void initState() {
    getOnboardShowed();
    super.initState();
  }

  void getOnboardShowed() async {
    final preferences = await SharedPreferences.getInstance();
    loggined = preferences.getBool('loggined');
    logouted = preferences.getBool('logouted');
    log(loggined.toString());
    log(logouted.toString());
    setState(() {});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: getPage(loggined, logouted),
    );
  }
}

Widget getPage(bool? loggined, bool? logouted) {
  if (loggined == true) {
    return LogoutPage();
  }
  if (logouted == true) {
    return LogoutPage();
  }
  return LoginPage();
}
