import 'package:firebase/components/auth/verify.dart';
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
  var _error;
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((User? user) {
      if (user == null) {
      } else if (user.emailVerified == false) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => VerifyScreen()));
      } else {
        print('User is signed in!');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    });

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
                            width: MediaQuery.of(context).size.width,
                            color: Colors.amber,
                            child: Row(children: [
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.error_outline,
                                    )),
                              ),
                              Spacer(),
                              Expanded(
                                flex: 6,
                                child: Center(
                                    child: Text(
                                  _error,
                                  style: TextStyle(fontSize: 12),
                                )),
                              ),
                              Spacer(),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _error = null;
                                      });
                                    },
                                    icon: Icon(Icons.close)),
                              ),
                            ]),
                          )
                        : Text("")),
                Text(
                  "Signin",
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
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email, password: _password);
                      } on FirebaseAuthException catch (e) {
                        print(e.message);
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
                      "Signin",
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
