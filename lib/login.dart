import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindcolors/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  UserCredential user;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email, password;
  String text = 'Sign in';
  String textAlt = 'Sign up';
  String textAltAdd = 'Don\'t have an account?';
  String buttonText = 'Login';
  bool signup;

  void createInEmailPass({String email, String pass}) async {
    try {
      user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      if (user != null) {
        print('created signin ');
        gotoHome();
      }
    } catch (e) {
      print(e);
    }
  }

  void signInEmailPass({String email, String pass}) async {
    try {
      user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      if (user != null) {
        print('signin email');
        gotoHome();
      }
    } catch (e) {
      print(e);
    }
  }

  void gotoHome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  void signInGoogle() async {
    GoogleSignInAccount gAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication gAuth = await gAccount.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    user = await _auth.signInWithCredential(credential);
    if (user != null) {
      gotoHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (signup == null)
      setState(() {
        signup = true;
      });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mind Colors',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // Image.asset(
            //   'assets/icon.png',
            //   width: 80,
            //   height: 80,
            // ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      email = value.trim();
                    });
                  },
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value.trim();
                    });
                  },
                ),
              ),
            ),
            // ignore: deprecated_member_use

            Container(
              height: 60,
              width: 360,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              // ignore: deprecated_member_use
              child: RaisedButton(
                padding: EdgeInsets.all(10),
                textColor: Colors.white,
                color: Colors.teal,
                child: Text(
                  buttonText,
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print(nameController.text);
                  print(passwordController.text);
                  try {
                    if (signup)
                      signInEmailPass(email: email, pass: password);
                    else
                      createInEmailPass(email: email, pass: password);
                  } catch (err) {
                    print(err);
                  }
                },
              ),
            ),
            Container(
                child: Row(
              children: <Widget>[
                Text(textAltAdd),
                // ignore: deprecated_member_use
                FlatButton(
                  textColor: Colors.redAccent,
                  child: Text(
                    textAlt,
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      if (signup) {
                        text = 'Sign up';
                        textAlt = 'Sign in';
                        textAltAdd = 'Already have an account? ';
                        buttonText = 'Register';
                        signup = false;
                      } else {
                        text = 'Sign in';
                        textAlt = 'Sign up';
                        textAltAdd = 'Don\'t have an account? ';
                        buttonText = 'Login';
                        signup = true;
                      }
                    });
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )),
            Container(
              height: 60,
              width: 360,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              // ignore: deprecated_member_use
              child: RaisedButton(
                padding: EdgeInsets.all(10),
                textColor: Colors.white,
                color: Colors.teal[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign up with',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      height: 25,
                      width: 25,
                      image: AssetImage('assets/google.png'),
                    )
                  ],
                ),
                onPressed: () {
                  signInGoogle();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
