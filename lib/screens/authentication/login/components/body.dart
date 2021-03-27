import 'package:chatapp/models/MenuModel.dart';
import 'package:chatapp/models/UserModel.dart';
import 'package:chatapp/repository/MenuRes.dart';
import 'package:chatapp/repository/UserRes.dart';
import 'package:chatapp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/rounded_button.dart';
import 'package:chatapp/components/full_text_field.dart';
import 'package:chatapp/components/alreadyHaveAccount.dart';
import '../../register/components/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chatapp/components/dialog.dart';
import 'package:chatapp/screens/home/home.dart';


class Body extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


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
            height: size.height *0.2,
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
            controller: _usernameController,
          ),
          FullTextField(obscureText: true,hintText: 'Password',icon: Icons.lock, iconColor: PrimaryColor,iconEnd: Icons.visibility,
            controller: _passwordController,

          ),
          RoundedButton(text:'LOG IN',color: PrimaryColor,textColor: Colors.white,fnc: ()async{
            UserModel checkLogin = await UserRes.loginUser(_usernameController.text,_passwordController.text);
            // List menu =  await MenuRes.getMenu();
            // print("Day la list model : $menu" );
            checkLogin != null ?
            Navigator.pushNamed(
                context,
                '/home'
            )
          :
          showDialog(
              context: context,
              child: AuthenticationDialog(
                textAction: "Re-Login",
                actionTextColor: Colors.red,
                titleText: "Wrong Authentication",
                titleTextColor: Colors.red,
                pathImage: "assets/login/image_dialog.png",
                fnc: (){
                  Navigator.pop(context);
                },
              )

          );
          },),
          AlreadyHaveAccount(fnc: (){
            Navigator.pushNamed(
                context,
                '/register'
            );
          })
        ],
      )
    );
  }
}






