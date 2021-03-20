import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
             Padding(
               padding: const EdgeInsets.symmetric(vertical:8.0,horizontal:15.0),
               child: Container(
                width: 100.0,
                height: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(100.0)
                  ),
                  child: Image.asset("assets/icon_poro.png")
            ),
             ) ,
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0,horizontal:15.0),
              child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text:"CHAT", style:TextStyle(color:Colors.lightBlueAccent,fontWeight:FontWeight.bold,fontFamily: 'Exo', fontSize: 40.0,letterSpacing: 5.0)),
                      TextSpan(text:" APP", style:TextStyle(color:Colors.red,fontWeight:FontWeight.bold,fontFamily: 'Exo', fontSize: 60.0,letterSpacing: 5.0))
                    ]
                  )
              ),
            ),
        ]
      )
    );
  }
}
