import 'package:firebase/components/main/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase/components/auth/authBar.dart';

class LoginAuth extends StatefulWidget {
  @override
  LoginAuthState createState() => LoginAuthState();
}

class LoginAuthState extends State<LoginAuth> {
  var _password;
  var _email;
  var _error;
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
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    });

    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: AuthBar(),
        body: SizedBox(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: _error != null
                        ? Container(
                            width: double.infinity,
                            color: Colors.amber,
                            child: Row(children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.error_outline,
                                  )),
                              Spacer(),
                              Center(child: Text(_error)),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _error = null;
                                    });
                                  },
                                  icon: Icon(Icons.close)),
                            ]),
                          )
                        : Text("")),
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
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password);
                      } on FirebaseAuthException catch (e) {
                        print(_error);

                        setState(() {
                          _error = e.message;
                        });
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
