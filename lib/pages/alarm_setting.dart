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
      _cardWidget(context, "Alarm 1", "Phone number"),

//      _cardWidget(context, Icons.person, "Alarm 2", "Phone number"),
//
//      _cardWidget(context, Icons.person, "Alarm 3", "Phone number"),
//
//      _cardWidget(context, Icons.person, "Alarm 4", "Phone number"),
//
//      _cardWidget(context, Icons.person, "Alarm 5", "Phone number"),
//
      _cardWidget(context, "Alarm 6", "Phone number"),];

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
                child: Center(child: Text("Overview", style: TextStyle(fontSize: 25),)),
              ),
            ),
            
            Container(
              width: 250,
              height: 250,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
//                boxShadow: [
//                  BoxShadow(color: Colors.red, offset: Offset(10, -10), blurRadius: 5),
//                ]
              ),
              child: Center(child: Image.asset("images/logo-alert.gif")),
            ),

            Container(
              height: bodyHeight - 350,
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
    );
  }

  Widget _cardWidget(BuildContext context , String name, String phoneNumber) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (_) => AlertDialog(
          title: Text(name),
          content: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 320,
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Card(
                  child: ListTile(
                    title: Image.asset('images/air.png'),
                    subtitle: Text("Text"),
                  )
                ),
                Card(
                    child: ListTile(
                      title: Image.asset('images/battery.png'),
                      subtitle: Text("Text"),
                    )
                ),
                Card(
                    child: ListTile(
                      title: Image.asset('images/battery_life.png'),
                      subtitle: Text("Text"),
                    )
                ),
                Card(
                    child: ListTile(
                      title: Image.asset('images/device.png'),
                      subtitle: Text("Text"),
                    )
                ),

              ],
            ),
          ),
        ));
      },
      child: Card(
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
                    width: 40,
                    height: 40,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(30),
//                        border: Border.all(width: 1)
//                    ),
                    child: InkWell(
                      child: Image.asset("images/color-logo-01.png"),
                      onTap: () {
                        print("RESET");
                      },
                    )
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
      ),
    );
  }
}
