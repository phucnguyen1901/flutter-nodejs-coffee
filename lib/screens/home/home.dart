
import 'package:flutter/material.dart';
import 'body.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.greenAccent,

        iconSize: 30.0,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            // activeIcon: ,
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: "User"
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
