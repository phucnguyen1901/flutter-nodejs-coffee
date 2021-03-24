
import 'package:flutter/material.dart';

import 'body.dart';

class DetailProDuct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Body(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            // activeIcon: ,
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_rounded),
              label: "Add To Cart"
          ),
        ],
        onTap: (index){
          index == 0 ? Navigator.pushNamed(context, '/home'): null;
        },
      ),
    );
  }
}
