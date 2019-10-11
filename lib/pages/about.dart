import 'package:firedot/main.dart';
import 'package:firedot/pages/setting.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {

  String desc = "Quantized properties: Certain properties, such as position, speed and color, can sometimes only occur in specific, set amounts, much like a dial that from number to number. This challenged a fundamental assumption of classical mechanics, which said that such properties should exist on a smooth, continuous spectrum. To describe the idea that some properties like a dial with specific settings, scientists coined the word.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[

              Card(
                elevation: 10,
                child: Container(
                  height: 100,
                  child: Center(child: Text("ABOUT US", style: TextStyle(fontSize: 25),)),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: Text(desc, style: TextStyle(fontSize: 20),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(currentIndex: 2)));
        },
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width + 50,
          color: Colors.orange,
          child: Center(
            child: ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text("BACK"),
            ),
          ),
        ),
      ),
    );
  }
}
