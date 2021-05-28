import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginAuth()));
          },
          child: Text("signout")),
    ));
  }
}
