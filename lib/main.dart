import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/Screens/LoginScreen.dart';
import 'package:flutter_projects/Screens/MainScreen.dart';
import 'package:flutter_projects/Screens/RegistrationScreen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.reference().child('users');

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
    builder: (context, snapshot) {
      return MaterialApp(
        title: 'Taxi Rider App',
        theme: ThemeData(
          fontFamily: "Brand-Regular",
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginScreen.idScreen,
        routes: {
          RegistrationScreen.idScreen: (context) => RegistrationScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
        },
        debugShowCheckedModeBanner: false,
      );
    }
    );

  }
}


