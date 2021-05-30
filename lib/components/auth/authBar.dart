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
          Container(
            height: MediaQuery.of(context).size.height / 13,
            child: Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginAuth()));
                },
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                      fontSize: 55,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 13,
            child: Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignupAuth()));
                },
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 55),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
