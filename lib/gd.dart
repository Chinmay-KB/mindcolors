import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Class used to generate dummy data for representational purposes
class GenerateData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    pushData();
    return Scaffold(
      body: Text('pushed'),
    );
  }

  Future pushData() async {
    final firestore = FirebaseFirestore.instance;
    final userRef = firestore.collection('users').doc('hamda.fzl@gmail.com');
    await userRef.update(
      {
        "moods": FieldValue.arrayUnion(
          List.generate(
              365,
              (index) => {
                    'mood': Random().nextInt(6),
                    'date': Random().nextInt(30).toString() +
                        Random().nextInt(12).toString() +
                        '2021'
                  }),
        )
      },
    );
  }
}
