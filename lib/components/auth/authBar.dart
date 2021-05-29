import 'package:firebase/components/auth/login.dart';
import 'package:firebase/components/auth/signup.dart';
import 'package:flutter/material.dart';

class AuthBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginAuth()));
            },
            child: Text(
              "SignIn",
              style: TextStyle(
                fontSize: 55,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignupAuth()));
            },
            child: Text(
              "SignUp",
              style: TextStyle(fontSize: 55),
            ),
          ),
        ],
      ),
    );
  }
}
