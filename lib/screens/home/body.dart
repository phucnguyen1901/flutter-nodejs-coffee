import 'package:chatapp/components/ElementMenu.dart';
import 'package:chatapp/components/ItemProduct.dart';
import 'package:chatapp/repository/MenuRes.dart';
import 'package:chatapp/repository/CartRes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List itemMenu;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List M = itemMenu;
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
                child: Text("Hi Phuc Pro !",style:TextStyle(fontSize: 20.0,fontFamily: "Exo", fontWeight: FontWeight.bold)),
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
            child:Text("This Week ",style:TextStyle(fontSize: 20.0,fontFamily: "Exo", fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            // color: Colors.blue,
            height: size.height*0.47,
            child:FutureBuilder<List>(
              future:  MenuRes.getMenu(),
              builder: (context,snapshot){
                if( snapshot.connectionState == ConnectionState.waiting){
                  return  Center(child: Text('Please wait its loading...'));
                }else{
                  if (snapshot.hasError)
                    return Center(child: Text('Error: ${snapshot.error}'));
                  else
                    return ListMenuHome(snapshot.data,size);
                }
              },
            )

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

  ListView ListMenuHome(List listProduct,Size size) {
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listProduct.length,
            itemBuilder: (context,index){
              return ItemProduct(
                  name: listProduct[index]["name"].toString(),
                  description: listProduct[index]["_id"].toString(),
                  img: listProduct[index]["img"].toString(),
                  price: listProduct[index]["price"].toString(),
                  fnc: (){

                    Navigator.pushNamed(context, '/detail',
                        arguments:
                        {
                        "_id": listProduct[index]["_id"].toString(),
                        "name":listProduct[index]["name"].toString(),
                        "img":listProduct[index]["img"].toString(),
                        "price": listProduct[index]["price"],
                        }
                    );
                    // CartRes.postCart(
                    //   {
                    //   "_id": listProduct[index]["_id"].toString(),
                    //   "name":listProduct[index]["name"].toString(),
                    //   "img":listProduct[index]["img"].toString(),
                    //   "price": listProduct[index]["price"],
                    //   }
                    // );
                  },
              );
            },
          );
  }
}

