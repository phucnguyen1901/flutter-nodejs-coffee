import 'package:chatapp/components/ElementMenu.dart';
import 'package:chatapp/components/ItemProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child:
        ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Hi Phuc Pro !",style:TextStyle(fontSize: 20.0)),
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: size.height*0.07,
                    width: size.width*0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                          image: AssetImage("assets/login/icon_user.png"),
                          fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
            ]
          ),
          // SizedBox(height: 20.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child:Text("This Week ",style:TextStyle(fontSize: 20.0)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            // color: Colors.blue,
            height: size.height*0.5,
            child:ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
            ItemProduct(pathImage:"assets/home/home_smoothie.png",size: size, nameItem: "Coffee Milk", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered",
            fnc:(){
              Navigator.pushNamed(context, '/detail');
            },),
            ItemProduct(pathImage:"assets/home/home_tea.png",size: size, nameItem: "Coffee Coffee", description: "Umbalasiba",),
            ItemProduct(pathImage:"assets/login/icon_user.png",size: size, nameItem: "Coffee tonay", description: "Umbalasiba",),
            ],
            ),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>
            [
              ElementMenu(size: size,pathImage: "assets/home/home_coffee.png",text: "Coffee",),
              ElementMenu(size: size,pathImage: "assets/home/home_smoothie.png",text: "Smoothie",),
              ElementMenu(size: size,pathImage: "assets/home/home_tea.png",text: "Tea",),
            ],
          ),
        ],
      ),

    );
  }
}

