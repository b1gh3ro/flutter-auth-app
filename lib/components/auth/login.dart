import 'package:firebase/components/main/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase/components/auth/authBar.dart';

class LoginAuth extends StatefulWidget {
  @override
  LoginAuthState createState() => LoginAuthState();
}

class LoginAuthState extends State<LoginAuth> {
  var _password;
  var _email;
  var _errorr;
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    User? user = FirebaseAuth.instance.currentUser;

    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    });

    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: AuthBar(),
        body: Container(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Signup",
                  style: TextStyle(fontSize: 55),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "ENTER EMAIL"),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "ENTER PASSWORD"),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          setState(() {
                            _errorr = 'The password provided is too weak.';
                          });
                        } else if (e.code == 'email-already-in-use') {
                          setState(() {
                            _errorr = e.code;
                          });
                        } else if (e.code == 'email-already-in-use') {
                          setState(() {
                            _errorr = e.code;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, right: 30, left: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
                Text(_errorr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
