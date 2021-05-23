import 'dart:math' as math;
import 'dart:ui';
import 'package:esys_flutter_share/esys_flutter_share.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screenshot/screenshot.dart';

class PainterView extends StatelessWidget {
  static final _user = FirebaseAuth.instance.currentUser;

  List<dynamic> moods = [];

  Future<bool> getList() async {
    final firestore = FirebaseFirestore.instance;
    print(getCurrentMail());
    final userRef = firestore.collection('users').doc(getCurrentMail());
    var res = await userRef.get();
    print(res.data());
    moods = res.data()['moods'];
    return true;
  }

  ScreenshotController screenshotController = ScreenshotController();

  captureScreenshot(context) async {
    final image = await screenshotController.capture();
    await Share.file('Share', 'share.png', image, 'image/png');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              GestureDetector(
                onTap: () {
                  captureScreenshot(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.share_rounded, color: Colors.grey),
                ),
              )
            ],
          ),
          body: FutureBuilder(
              future: getList(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Screenshot(
                    controller: screenshotController,
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        children: [
                          InteractiveViewer(
                            panEnabled: true,
                            minScale: 1,
                            maxScale: 5,
                            child: CustomPaint(
                              painter: ShapePainter(moods),
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
                                  'Mindcolors of ${getCurrentName()} in 2021',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  textAlign: TextAlign.left,
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              })),
    );
  }

  String getCurrentName() => _user.displayName;
  static String getCurrentMail() => _user.email;
}

class ShapePainter extends CustomPainter {
  final List<dynamic> moods;
  ShapePainter(this.moods);

  static Color getColor(int mood) {
    switch (mood) {
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
    for (int i = 0; i < moods.length; i++) {
      Offset startingPoint = Offset((size.width / 365) * (i), 0);
      Offset endingPoint = Offset((size.width / 365) * (i), size.height);
      var paint = Paint()
        ..color = getColor(moods[i]['mood']).withOpacity(1.0)
        ..strokeWidth = size.width / 365;
      canvas.drawLine(startingPoint, endingPoint, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
