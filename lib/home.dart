import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindcolors/painter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Home extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<Home> {



  void add_moods(int mood){
    String date;
    date = DateTime.now().toString();
    date= '${date.substring(8,10)}${date.substring(5,7)}${date.substring(0,4)}';

    var firebaseUser =  FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("users").doc(firebaseUser.email).update({
      "moods" : FieldValue.arrayUnion([

        {
          'mood': mood, 'date': date
        },
      ])
      }).then((_) {
        print("success!");
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => PainterView())),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.collections),
            ),
          )
        ],
        title: Row(
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              height: 40,
              width: 40,
            ),
            Text("  MIND COLORS"),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "How are you feeling today?",
              style: TextStyle(
                color: Colors.teal[700],
                fontSize: 20,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            primary: true,
            childAspectRatio: 1 / 1,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                color: Colors.transparent,
                child: Center(
                  child: FlatButton(
                    minWidth: 0,
                    onPressed: () {

                        add_moods(0);

                    },
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                gradient: LinearGradient(colors: [
                                  Colors.yellowAccent[200],
                                  Colors.amberAccent[700]
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              height: 150.0,
                              width: 150.0,
                              child: Image.asset(
                                "assets/happy.png",
                              ),
                            ),
                          ),
                        ),
                        Text("Happy"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Center(
                  child: FlatButton(
                    minWidth: 0,
                    onPressed: () {

                        add_moods(1);
                      },
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                gradient: LinearGradient(colors: [
                                  Colors.amber[700],
                                  Colors.red[900]
                                ]),
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              height: 150.0,
                              width: 150.0,
                              child: Image.asset(
                                "assets/anger.png",
                              ),
                            ),
                          ),
                        ),
                        Text("Angry"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Center(
                  child: FlatButton(
                    minWidth: 0,
                    onPressed: () {

                      add_moods(2);
                    },
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                gradient: LinearGradient(colors: [
                                  Colors.greenAccent[200],
                                  Colors.green[700]
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              height: 150.0,
                              width: 150.0,
                              child: Image.asset(
                                "assets/disgust.png",
                              ),
                            ),
                          ),
                        ),
                        Text("Disgust"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Center(
                  child: FlatButton(
                    minWidth: 0,
                    onPressed: () {
                      add_moods(3);
                      },
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                gradient: LinearGradient(colors: [
                                  Colors.deepPurpleAccent[200],
                                  Colors.indigo[700]
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              height: 150.0,
                              width: 150.0,
                              child: Image.asset(
                                "assets/fear.png",
                              ),
                            ),
                          ),
                        ),
                        Text("Fear"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Center(
                  child: FlatButton(
                    minWidth: 0,
                    onPressed: () {

                      add_moods(4);
                    },
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                gradient: LinearGradient(colors: [
                                  Colors.blueGrey[100],
                                  Colors.blue[400]
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              height: 150.0,
                              width: 150.0,
                              child: Image.asset(
                                "assets/sadness.png",
                               ),
                            ),
                          ),
                        ),
                        Text("Sad"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Center(
                  child: FlatButton(
                    minWidth: 0,
                    onPressed: () {

                      add_moods(5);
                    },
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                gradient: LinearGradient(colors: [
                                  Colors.pink[200],
                                  Colors.pinkAccent[700]
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                              height: 150.0,
                              width: 150.0,
                              child: Image.asset(
                                "assets/surprise.png",
                              ),
                            ),
                          ),
                        ),
                        Text("Surprised"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Container(
                height: 60,
                width: 360,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    textColor: Colors.white,
                    color: Colors.teal,
                    child: Text(
                      "DONE",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => PainterView()));

                    })),
          ),
        ],
      ),
    );
  }
}

