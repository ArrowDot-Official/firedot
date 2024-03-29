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
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.orange,
      ),
    );
  }

  _cardWidget(BuildContext context ,IconData iconImage, String name, String phoneNumber) {
    return Card(
      elevation: 5,
      child: Container(
        height: 70,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1)
                ),
                child: Icon(iconImage)
              ),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(name),
                    Text(phoneNumber),

                  ],
                ),
              ),


//            Container(
//              width: 30,
//              color: Colors.red,
//              child: ListTile(
//                title: Text(name),
//                subtitle: Text(phoneNumber),
//              ),
//            ),

              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {

                      },
                      child: Icon(Icons.edit, color: Colors.black,),
                    ),

                    InkWell(
                        onTap: () {

                        },
                        child: Icon(Icons.delete, color: Colors.red,),
                    )
                  ],
                ),
              ),

            ],
//          leading: Container(
//            width: 30,
//            height: 30,
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(30),
//              border: Border.all(width: 1)
//            ),
//            child: Icon(iconImage)
//          ),
//          trailing: Container(
//            height: 30,
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Icon(Icons.delete),
//                Icon(Icons.edit)
//              ],
//            ),
//          ),
//          title: Text(name),
//          subtitle: Text(phoneNumber),
          ),
        ),
      ),
    );
  }
}
