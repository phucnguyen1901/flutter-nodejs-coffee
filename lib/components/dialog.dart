
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticationDialog extends StatelessWidget {
   final String textAction ,titleText;
   final String pathImage;
   final Color titleTextColor,actionTextColor;
   final Function fnc;

   AuthenticationDialog({
   Key key,
     this.textAction,
     this.pathImage,
     this.titleTextColor,
     this.actionTextColor,
     this.titleText,
     this.fnc
   }): super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoAlertDialog(
        title: Text(titleText, style: TextStyle(fontSize: 20.0,color:titleTextColor),),
        content: Container(
          margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          height: size.width * 0.2,
          child:Image.asset(pathImage)
        ),
        actions: [
          CupertinoDialogAction(
          child:FlatButton(
            onPressed: fnc,
            child: Text(textAction,style:TextStyle(color:actionTextColor,fontSize:20.0,fontWeight: FontWeight.bold))),
          )
        ],
      );
  }
}


