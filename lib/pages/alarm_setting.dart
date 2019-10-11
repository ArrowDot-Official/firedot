import 'package:firedot/main.dart';
import 'package:flutter/material.dart';

class AlarmSettingPage extends StatefulWidget {
  @override
  _AlarmSettingPageState createState() => _AlarmSettingPageState();
}

class _AlarmSettingPageState extends State<AlarmSettingPage> {

  List<Widget> _widgets;

  @override
  void initState() {
    // TODO: implement initState

    _widgets = [
      _cardWidget(context, Icons.person, "Alarm 1", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 2", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 3", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 4", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 5", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 6", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 1", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 2", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 3", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 4", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 5", "Phone number"),

      _cardWidget(context, Icons.person, "Alarm 6", "Phone number"),];

    super.initState();
  }

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
                child: Center(child: Text("Alarm Setting", style: TextStyle(fontSize: 25),)),
              ),
            ),

            Container(
              height: bodyHeight,
              width: MediaQuery.of(context).size.width - 10,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _widgets
                  ),
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

  Widget _cardWidget(BuildContext context ,IconData iconImage, String name, String phoneNumber) {
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

                        setState(() {

                        });
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
