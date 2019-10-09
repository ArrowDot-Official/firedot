import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var bodyHeight =  MediaQuery.of(context).size.height - 201;
    print(bodyHeight);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Container(
                height: 100,
                child: Center(child: Text("HOME", style: TextStyle(fontSize: 25),)),
              ),
            ),


            Container(
              height: bodyHeight,
              child: _body(context, bodyHeight),
            )
          ],
        ),
      ),
    );
  }

  Widget _alarm(BuildContext context, double bodyHeight) {
    var alarmHeight = bodyHeight * 2 / 3 - 80;
    return Stack(
      children: <Widget>[

        Positioned(
          top: 10,
          right: 25,
          left: 25,
          child: Container(
            width: MediaQuery.of(context).size.width - 10,
            height: alarmHeight,
            child: GridView.count(
              crossAxisCount: 3,
              scrollDirection: Axis.horizontal,
              children: List.generate(20, (index) {
                return Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: ListTile(
                      title: Image.asset("images/noti.png"),
                      subtitle: Text("alarm", textAlign: TextAlign.center,),
                    ),
                  )
                );
              }),

            ),
          ),
        )

      ],
    );
  }

  Widget _body(BuildContext context, double bodyHeight) {
    var boxWidth = MediaQuery.of(context).size.width - 10;
    var boxHeight = bodyHeight / 3;

    var circleRadius = 50.0;

    return Stack(
      children: <Widget>[

        Positioned(
          bottom: 25,
          right: 25,
          left: 25,
          child: Container(
            width: boxWidth,
            height: boxHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey
            ),
            child: Center(
              child: Text("This is notification"),
            ),
          ),
        ),
        Positioned(
          bottom: boxHeight ,
          right: boxWidth / 2 - circleRadius/4,
          child: Container(
            width: circleRadius,
            height: circleRadius,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(circleRadius),
              color: Colors.white,
              border: Border.all(width: 2),
            ),
            child: Image.asset("images/noti.png"),
          ),
        ),
        _alarm(context, bodyHeight)

      ],
    );
  }
}
