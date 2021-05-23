import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mindcolors/home.dart';
import 'package:mindcolors/painter.dart';
import 'package:mindcolors/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Altruist',
      theme: ThemeData(
        accentColor: Colors.orange,
        primarySwatch: Colors.blueGrey,
      ),
      home: LoginPage(),
    );
  }
}
