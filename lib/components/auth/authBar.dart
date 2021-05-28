import 'package:flutter/material.dart';

class AuthBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: null,
            child: Text(
              "SignIn",
              style: TextStyle(
                fontSize: 55,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: null,
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
