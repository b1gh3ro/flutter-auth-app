import 'package:firebase/components/auth/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/signup.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else if (user.emailVerified == false) {
        print("hello");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => VerifyScreen()));
      }
    });
    return Container(
        child: Center(
      child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then((_) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignupAuth()));
            });
          },
          child: Text("signout")),
    ));
  }
}
