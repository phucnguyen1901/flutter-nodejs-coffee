

import 'package:flutter/material.dart';

import 'body.dart';
import 'bottom.dart';
class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Text("Your Cart", style: TextStyle(fontSize: 15.0, color: Colors.white),),
              Text("4 Items", style: TextStyle(fontSize: 12.0,fontFamily: "Exo",fontWeight: FontWeight.bold, color: Colors.white),),
            ],
          ),
          leading: IconButton(icon:Icon(Icons.arrow_back), color:Colors.white,
            onPressed: (){
            Navigator.pop(context);
            },
          ),
        ),
        body:Body(),
        bottomNavigationBar: Bottom()
    );
  }
}