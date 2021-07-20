import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/Screens/LoginScreen.dart';
import 'package:flutter_projects/Screens/MainScreen.dart';
import 'package:flutter_projects/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 35.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 390,
                height: 250,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "Register as Rider",
                style: TextStyle(fontSize: 24, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Phone No.",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    ElevatedButton(
                      child: const Text('Create Account'),
                      onPressed: () {
                        if (nameTextEditingController.text.length < 4) {
                          displayMessage(
                              "Name must be at least 4 character long",
                              context);
                        } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(emailTextEditingController.text)) {
                          displayMessage(
                              "Please enter a valid email address", context);
                        } else if (phoneTextEditingController.text.isEmpty) {
                          displayMessage("Phone number is required", context);
                        } else if (passwordTextEditingController.text.length <
                            6) {
                          displayMessage(
                              "Password must be at least 6 character long",
                              context);
                        } else {
                          registerNewUser(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.idScreen, (route) => false);
                },
                child: Text("Already have an account? Login here."),
                style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    final firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text).catchError((err) {
      displayMessage("Error: " + err.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      Map userDataMap = {
        'name': nameTextEditingController.text.trim(),
        'email': emailTextEditingController.text.trim(),
        'phone': phoneTextEditingController.text,
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayMessage(
          'Congratulations, your account has been created.', context);
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.idScreen, (route) => false);
    } else {
      displayMessage("New user account has not been created", context);
    }
  }

  displayMessage(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }
}
