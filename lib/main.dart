import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindcolors/home.dart';
import 'package:mindcolors/login.dart';
import 'package:mindcolors/painter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Altruist',
      theme: ThemeData(
        accentColor: Colors.orange,
        primarySwatch: Colors.blueGrey,
      ),
      home: getCurrentUser() ? Home() : LoginPage(),
    );
  }

  getCurrentUser() {
    final _user = FirebaseAuth.instance.currentUser;
    try {
      return _user.displayName != null;
    } catch (e) {
      return false;
    }
  }
}
