import 'package:flutter/material.dart';
import 'package:chatapp/style.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final bool login;
  final Function fnc;
  const AlreadyHaveAccount({
    Key key,
    this.login = false,
    this.fnc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            login ? "Already have an account ? ":"Don't have an account? ",
            style: TextStyle(color:lightColor),
          ),
          GestureDetector(
              onTap: fnc,
              child:Text(login ? 'Sign In':'Sign Up',style:TextStyle(color:Colors.white, fontWeight: FontWeight.bold))
          )
        ],

      ),
    );
  }
}