import 'package:flutter/material.dart';
import 'package:chatapp/style.dart';

class ItemProduct extends StatelessWidget {

  final String nameItem;
  final String description;
  final String pathImage;
  final Function fnc;
  const ItemProduct({
    Key key,
    this.nameItem,
    this.description,
    this.pathImage,
    this.fnc,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      width: size.width*0.6,
      height: size.height*0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        // color:Colors.green,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0),
            // width: size.width*0.5,
            height: size.height*0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.greenAccent
            ),
            child:Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0,50.0,5.0,0.0),
                  child: Center(child: Text(nameItem, style:TextStyle(fontSize: size.width*0.06))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
                  child: Text(description),
                ),
              ],
            ),

          ),
          Positioned(
              // top: -40,
              height: size.height * 0.1,
              width: size.width*0.6,
              child:Center(
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(pathImage,
                        ),
                        // fit: BoxFit.contain
                      )
                  ),
                ),
              )
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child:Text("\$3", style: TextStyle(color:Colors.green,fontSize: 35.0),),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child:Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: IconButton(
                color: pinkColor,
                iconSize: 40.0,
                onPressed: fnc,
                icon: Icon(Icons.add_shopping_cart_rounded),
                // size: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
