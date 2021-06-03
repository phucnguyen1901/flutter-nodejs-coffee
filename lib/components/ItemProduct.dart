import 'package:flutter/material.dart';
import 'package:chatapp/style.dart';

class ItemProduct extends StatelessWidget {
  final String name;
  final String description;
  final String img;
  final Function fnc;
  final double price;

  const ItemProduct({
    Key key,
    this.name,
    this.description,
    this.img,
    this.fnc,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double SizeName = name.length >= 18 ? size.width * 0.04 : size.width * 0.05;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      width: size.width * 0.65,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        // color:Colors.green,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: size.height * 0.06),
            // width: size.width*0.5,
            height: size.height * 0.47,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).primaryColor),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 50.0, 5.0, 0.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: SizeName,
                          color: Colors.white,
                          fontFamily: "Exo",
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                  child: Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                      style: TextStyle(
                          fontSize: size.width * 0.03,
                          color: Colors.white,
                          fontFamily: "Exo",
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Positioned(
              left: size.width * 0.1 - 23,
              height: size.height * 0.12,
              width: size.width * 0.6,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/home/$img",
                    ),
                    // fit: BoxFit.contain
                  )),
                ),
              )),
          Positioned(
            bottom: 10,
            left: 20,
            child: Text(
              "\$$price",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 35.0,
                  fontFamily: "Exo",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
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
