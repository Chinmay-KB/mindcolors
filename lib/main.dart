import 'package:flutter/material.dart';
import 'package:mindcolors/home.dart';
import 'package:mindcolors/painter.dart';

void main() {
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
      home: PainterView(),
    );
  }
}

