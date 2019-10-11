import 'dart:async';

import 'package:firedot/main.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => MyHomePage(currentIndex: 0,)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height - 60,
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.orange)
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  RichText(text: TextSpan(
                    text: "WELCOME!",
                    style: TextStyle(fontSize: 25, color: Colors.black),),
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width - 100,
                    child: Image.asset("images/logo.jpg"),
                  ),
                  Text("Powered By ArrowDot")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


