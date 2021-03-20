
import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {

  final String text;
  final Function fnc;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.fnc,
    this.color,
    this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child:FlatButton(
            padding: EdgeInsets.symmetric(vertical: 10.0,),
            color: color,
            child:Text(text, style: TextStyle(color: textColor, fontSize: 20.0),),
            onPressed: (){

            },
          )
      ),
    );
  }
}
