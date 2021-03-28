import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30.0,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          // activeIcon: ,
            icon: Icon(Icons.home),
            label: "Home"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Orders"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart"
        ),
      ],
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
        switch(index) {
          case 0: {

          }
          break;

          case 1: {
            Navigator.pushNamed(context, '/history');
          }
          break;
          case 2: {
            Navigator.pushNamed(context, '/cart');
          }
          break;

          default: {
            //statements;
          }
          break;
        }

      },
    );
  }
}
