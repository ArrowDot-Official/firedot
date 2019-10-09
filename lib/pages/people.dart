import 'package:flutter/material.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
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
                child: Center(child: Text("User Accounts", style: TextStyle(fontSize: 25),)),
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

                    _cardWidget(context, Icons.person, "Your name", "Phone number"),

                    _cardWidget(context, Icons.person, "Your name", "Phone number"),

                    _cardWidget(context, Icons.person, "Your name", "Phone number"),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _cardWidget(BuildContext context ,IconData iconImage, String name, String phoneNumber) {
    return Card(
      elevation: 5,
      child: Container(
        child: ListTile(
          leading: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1)
            ),
            child: Icon(iconImage)
          ),
          title: Text(name),
          subtitle: Text(phoneNumber),

        ),
      ),
    );
  }
}
