import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                            ),
                          ),
                        ),
                        Text("Sadness"),
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
                    onPressed: () {},
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
                    onPressed: () {})),
          ),
        ],
      ),
    );
  }
}
