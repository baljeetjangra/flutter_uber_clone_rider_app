import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 35.0,),
              Image(image:AssetImage("images/logo.png"),
                width: 390, height: 250, alignment: Alignment.center,
              ),
              SizedBox(height: 1,),
              Text("Register as Rider",
                style: TextStyle(fontSize: 24, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 1,),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontSize: 14
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                          )
                      ),
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),

                    SizedBox(height: 1,),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontSize: 14
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                          )
                      ),
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    SizedBox(height: 1,),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Phone No.",
                          labelStyle: TextStyle(
                              fontSize: 14
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                          )
                      ),
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    SizedBox(height: 1,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 14
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                          )
                      ),
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    SizedBox(height: 1,),
                    ElevatedButton(child: const Text('Create Account'),
                      onPressed: (){
                        print("login button clicked");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            )
                        ),
                      ),
                    )

                  ],
                ),
              ),
              TextButton(onPressed: (){
                print("register");
              }, child: Text(
                  "Already have an account? Login here."
              ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
