import 'dart:math' as math;
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PainterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            InteractiveViewer(
              panEnabled: true,
              minScale: 1,
              maxScale: 5,
              child: CustomPaint(
                painter: ShapePainter(),
                child: Container(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40,
                width: double.maxFinite,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Mindcolors for 2021\n${getCurrentUser()}',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  String getCurrentUser() {
    final _user = FirebaseAuth.instance.currentUser;
    return _user.displayName;
  }
}

class ShapePainter extends CustomPainter {
  final items = List<Color>.generate(365, (index) => getColor(index));

  static Color getColor(int index) {
    final rand = math.Random();
    switch (rand.nextInt(365) % 6) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.pink;
      case 2:
        return Colors.teal;
      case 3:
        return Colors.amber;
      case 4:
        return Colors.red;
      default:
        return Colors.greenAccent;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < items.length; i++) {
      Offset startingPoint = Offset((size.width / items.length) * (i), 0);
      Offset endingPoint =
          Offset((size.width / items.length) * (i), size.height);
      var paint = Paint()
        ..color = items[i].withOpacity(1.0)
        ..strokeWidth = size.width / items.length;
      canvas.drawLine(startingPoint, endingPoint, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
