import 'package:flutter/material.dart';
import 'package:flutter_projects/Screens/LoginScreen.dart';
import 'package:flutter_projects/Screens/MainScreen.dart';
import 'package:flutter_projects/Screens/RegistrationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Rider App',
      theme: ThemeData(
        fontFamily: "Brand-Regular",
        primarySwatch: Colors.blue,
      ),
      home: RegistrationScreen(),
      debugShowCheckedModeBanner: false,
    );

  }
}


