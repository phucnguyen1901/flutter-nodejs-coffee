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
      this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(pathImage)
              )
          ),
        ),
        SizedBox(width: size.width*0.12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: size.width*0.5,
                child: Text(title, style: TextStyle(fontSize: 20.0,fontFamily: "Exo"))
            ),
            RichText(
              text: TextSpan(
                  text: price, style: TextStyle(fontSize: 20.0,color:Colors.green),
                  children: <TextSpan>[
                    TextSpan(text: qty,style: TextStyle(fontSize: 20.0,color:Colors.black,fontFamily: "Exo"))
                    // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
                    // TextSpan(text: ' world!'),
                  ]
              ),

            )
          ],
        )
      ],

    );
  }
}

