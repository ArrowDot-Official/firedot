import 'package:firedot/pages/about.dart';
import 'package:firedot/pages/topup.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bodyHeight = MediaQuery.of(context).size.height - 201;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Container(
                height: 100,
                child: Center(child: Text("SETTING", style: TextStyle(fontSize: 25),)),
              ),
            ),

            Container(
              height: bodyHeight,
              width: MediaQuery.of(context).size.width - 10,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    SizedBox(height: 50,),

                    _cardWidget(context, () {

                    }, Icons.settings, "Alarm Setting"),

                    _cardWidget(context, () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopUpPage()));
                    }, Icons.attach_money, "Top Up"),

                    _cardWidget(context, () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()));
                    }, Icons.info, "About Us"),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _cardWidget(BuildContext context, Function onPressed, IconData iconImage, String title) {
    return FlatButton(
      onPressed: onPressed,
      child: Card(
        elevation: 5,
        child: Container(
          child: ListTile(
            leading: Icon(iconImage),
            title: Text(title),
          ),
        ),
      ),
    );
  }
}
