import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'authBar.dart';

class LoginAuth extends StatefulWidget {
  @override
  LoginAuthState createState() => LoginAuthState();
}

class LoginAuthState extends State<LoginAuth> {
  var _password;
  var _email;

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    // ignore: unused_local_variable
    User? user = FirebaseAuth.instance.currentUser;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
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
                      await auth.createUserWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );
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
                ElevatedButton(
                    onPressed: () {
                      auth.signOut();
                    },
                    child: Text("signout")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
