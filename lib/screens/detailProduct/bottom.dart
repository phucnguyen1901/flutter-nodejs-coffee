
import 'package:chatapp/style.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery.of(context).size;
    return RaisedButton(
      padding: EdgeInsets.all(0.0),
      color: Colors.white,
      onPressed: (){
          print("day la data $data");
      },
      child: Container(
        height: size.height*0.08,
          decoration: BoxDecoration(
            color: midPinkColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(40.0))
            // borderRadius: BorderRadius.circular(10.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Add To Cart",style: TextStyle(color: Colors.white),),
              SizedBox(width: 10.0,),
              Icon(Icons.add_shopping_cart_rounded,color: Colors.white),
            ],
          )
      ),
    );
  }
}
