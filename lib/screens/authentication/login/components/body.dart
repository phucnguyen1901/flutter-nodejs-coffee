import 'package:chatapp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/rounded_button.dart';
import 'package:chatapp/components/full_text_field.dart';
import 'package:chatapp/components/alreadyHaveAccount.dart';
import '../../register/components/register.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.deepPurple,
      height: size.height,
      width: size.width,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: size.width * 0.8,
            child:Image.asset("assets/login/bg_login_1.png")
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            width: size.width * 0.9,
            height: size.height * 0.02,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(20.0)
            ),
          ),
          FullTextField(hintText: 'Username',icon: Icons.person, iconColor: PrimaryColor,
          onChanged: (value){

          },
          ),
          FullTextField(obscureText: true,hintText: 'Password',icon: Icons.lock, iconColor: PrimaryColor,iconEnd: Icons.visibility,
            onChanged: (value){

            },

          ),
          RoundedButton(text:'LOG IN',color: PrimaryColor,textColor: Colors.white,fnc: (){},),
          AlreadyHaveAccount(fnc: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return Register();
                    }
                )
            );
          })
        ],
      )
    );
  }
}






