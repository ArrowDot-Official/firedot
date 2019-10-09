import 'package:firedot/pages/about.dart';
import 'package:firedot/pages/home.dart';
import 'package:firedot/pages/people.dart';
import 'package:firedot/pages/setting.dart';
import 'package:firedot/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: WelcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int currentIndex;
  MyHomePage({Key key, this.currentIndex}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  List<Widget> _children = [PeoplePage(), HomePage(),SettingPage()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: _currentIndex,
          backgroundColor: Colors.orange,
          selectedItemColor: Colors.grey[500],
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("People")
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.info),
                title: Text("Home")
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text("Setting")
            )
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
