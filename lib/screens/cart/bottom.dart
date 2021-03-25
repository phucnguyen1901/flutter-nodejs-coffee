import 'package:flutter/material.dart';
import 'package:chatapp/style.dart';
class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RaisedButton(
      color: lightColor,
      onPressed: (){

      },
      child: Container(
        width: size.width,
        height: size.height*0.08,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Total: \$6.99",style: TextStyle(fontSize:20.0,color: Colors.white),),
            Text("Order Now",style: TextStyle(fontSize:20.0,color: Colors.white),),
            // Text("Order Now",style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }

}
