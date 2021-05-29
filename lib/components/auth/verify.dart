import 'dart:async';

import 'package:firebase/components/main/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  var timer;

  Future<void> checkEmailVerified() async {
    if (user!.emailVerified == true) {
      print("true");
      timer.cancel();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      user = FirebaseAuth.instance.currentUser;
      user!.reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    user!.sendEmailVerification();
    const oneSec = const Duration(seconds: 5);
    timer = new Timer.periodic(oneSec, (Timer t) => checkEmailVerified());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("An email has been sent to ${user!.email}. please verify"),
          ],
        ),
      ),
    );
  }
}
