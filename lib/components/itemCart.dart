import 'package:flutter/material.dart';
import 'package:chatapp/style.dart';

class ItemCart extends StatelessWidget {

  final String title, price, qty ,pathImage;


  const ItemCart({
    Key key,
    this.title,
    this.price,
    this.qty,
    @required this.pathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        SizedBox(height:size.height*0.18,width: size.width*0.05,),
        Container(
          width: size.width*0.3,
          height: size.height*0.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: lightGreyColor,
              image: DecorationImage(
                  image: AssetImage("assets/home/$pathImage")
              )
          ),
        ),
        SizedBox(width: size.width*0.12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: size.width*0.5,
                child:RichText(
                  text: TextSpan(
                      text: "$qty x ", style: TextStyle(color:Colors.black,fontSize: 20.0,fontFamily: "Exo", fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: title,style: TextStyle(fontSize: 20.0,color:Colors.black,fontFamily: "Exo", fontWeight: FontWeight.bold))
                      ]
                  ),

                )
                // child: Text(title, style: TextStyle(fontSize: 20.0,fontFamily: "Exo", fontWeight: FontWeight.bold))
            ),
            Text("\$${(double.parse(price)*double.parse(qty)).toStringAsFixed(2)}", style: TextStyle(fontSize: 15.0,color:Colors.green))
          ],
        )
      ],

    );
  }
}

