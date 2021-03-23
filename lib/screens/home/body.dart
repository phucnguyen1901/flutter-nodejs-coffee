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
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Welcome Phuc Pro !",style:TextStyle(fontSize: 20.0)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 100.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                      image: AssetImage("assets/login/icon_user.png"),
                      fit: BoxFit.cover
                    )
                ),
              ),
            ]
          ),
          SizedBox(height: 20.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child:Text("This Week ",style:TextStyle(fontSize: 20.0)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            // color:Colors.blue,
            height: size.height*0.4,
            child:ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Wrap(
              children:[
            ItemProduct(size: size, nameItem: "Coffee Milk", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered"),
            ItemProduct(size: size, nameItem: "Coffee Coffee", description: "Umbalasiba",),
            ItemProduct(size: size, nameItem: "Coffee tonay", description: "Umbalasiba",),

        ]),
              ],
            ),
          ),
          SizedBox(height: 15.0,)
        ],
      ),
    )
    ;
  }
}

class ItemProduct extends StatelessWidget {

  final String nameItem;
  final String description;

  const ItemProduct({
    Key key,
    this.nameItem,
    this.description,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.0),
    width: size.width*0.6,
    height: size.height*0.4,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color:Colors.blue,
    ),
    child:Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0,15.0,5.0,0.0),
              child: Center(child: Text(nameItem, style:TextStyle(fontSize: size.width*0.06))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
              child: Text(description),
            ),

          ],
        ),
        Positioned(
          top: -90,
          // left: 0,
          child:Container(
            height: size.width * 0.4,
            width: size.height* 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/login/icon_user.png",
                    ),
                    // fit: BoxFit.contain
                )
            ),
          )


        ),
        Positioned(
          bottom: 10,
          left: 20,
            child:Text("\$3", style: TextStyle(fontSize: 50.0),),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child:IconButton(
              iconSize: 50.0,
              onPressed: (){

              },
              icon: Icon(Icons.add_shopping_cart_sharp),
              // size: 20.0,
              ),
        )
          ],
    )
    );
  }
}





// Container(
// height: size.width * 0.4,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage("assets/login/bg_login_2.png",
// ),
// fit: BoxFit.contain
// )
// ),
// )

