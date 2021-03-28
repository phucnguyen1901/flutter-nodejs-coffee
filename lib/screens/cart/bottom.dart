import 'package:flutter/material.dart';
import 'package:chatapp/style.dart';
class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomNavigationBar(
      iconSize: 35.0,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money_outlined),
          label:"Cash: \$6.99",
          backgroundColor: Colors.white
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
            //statements;
          }
          break;

          default: {
            //statements;
          }
          break;
        }

      },
    );
    // return Row(
    //   children: <Widget>[
    //     RaisedButton(
    //       color: Theme.of(context).primaryColor,
    //       onPressed: (){
    //
    //       },
    //       child: Container(
    //         width: size.width/2 - 15,
    //         height: size.height*0.05,
    //
    //         child: Text("Total: \$6.99",style: TextStyle(fontSize:20.0,color: Colors.white),),
    //             // Text("Order Now",style: TextStyle(color: Colors.white))
    //       ),
    //     ),
    //     RaisedButton(
    //       color: Theme.of(context).primaryColor,
    //       onPressed: (){
    //
    //       },
    //       child: Container(
    //         width: size.width/2,
    //         height: size.height*0.05,
    //
    //         child: Text("Total: \$6.99",style: TextStyle(fontSize:20.0,color: Colors.white),),
    //         // Text("Order Now",style: TextStyle(color: Colors.white))
    //       ),
    //     ),
    //   ],
    // );
  }

}
// Text("Order Now",style: TextStyle(fontSize:20.0,color: Colors.white),),