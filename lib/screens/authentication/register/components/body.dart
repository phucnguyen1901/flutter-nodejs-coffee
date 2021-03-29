import 'dart:convert';

import 'package:chatapp/repository/UserRes.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/rounded_button.dart';
import 'package:chatapp/components/full_text_field.dart';
import 'package:chatapp/components/alreadyHaveAccount.dart';
import 'package:chatapp/components/dialog.dart';
import 'package:chatapp/style.dart';
import 'package:chatapp/screens/authentication/login/components/login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;



class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final Map infoRegister = new Map();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  bool _passwordVisible = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _loading ? Container(
        height: size.height,
        width: size.width,
        color: Colors.deepPurple,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitRing(
              color: Theme.of(context).primaryColor,
              size: 120.0,
            ),
            SizedBox(height: 15.0,),
            Text("Đợi chút xíu , server free nên load lần đầu chậm", style:TextStyle(color: Theme.of(context).primaryColor,)),
            Text("Còn không zô được thì lỗi bà nó rồi", style:TextStyle(color: Theme.of(context).primaryColor,)),

            SizedBox(height: 15.0,),
            Text("Wait a minute", style:TextStyle(color: Theme.of(context).primaryColor,))
          ],

        )
    )
        :Container(
      color: Colors.deepPurple,
      height: size.height,
      width: size.width,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: size.width * 0.8,
                height: size.height * 0.25,
                child:Image.asset("assets/login/bg_login_5.png")
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
            FullTextField(hintText: 'FullName',icon: Icons.accessibility, iconColor: PrimaryColor,
              controller: _nameController,maxLine: 1,
            ),
            FullTextField(hintText: 'Username',icon: Icons.person, iconColor: PrimaryColor,
              controller: _usernameController,maxLine: 1,
            ),
            FullTextField(obscureText: !_passwordVisible,hintText: 'Password',icon: Icons.lock, iconColor: PrimaryColor,iconEnd: Icons.visibility,
              controller: _passwordController,maxLine: 1,iconButton: IconButton(
                icon: _passwordVisible ? Icon(Icons.visibility,color: PrimaryColor,) : Icon(Icons.visibility_off,color: PrimaryColor),
                onPressed: (){
                  setState((){
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),

            ),
            RoundedButton(text:'SIGN UP',color: PrimaryColor,textColor: Colors.white,fnc: () async{

              setState(() {
                _loading = !_loading;
              });

              Map checkRegister = await UserRes.registerUser(_usernameController.text,_passwordController.text,_nameController.text);

              checkRegister == null ? setState((){
                _loading = !_loading;
              }): null;

              checkRegister != null ?
              showDialog(
                  context: context,
                  child: AuthenticationDialog(
                    textAction: "Sign Up Now",
                    actionTextColor: Colors.green,
                    titleText: "Successfully",
                    titleTextColor: Colors.green,
                    pathImage: "assets/login/image_dialog_success.png",
                    fnc: (){
                      Navigator.pushNamed(
                          context,
                          '/login'
                      );
                    },
                  )
              ) :
              showDialog(
                  context: context,
                  child: AuthenticationDialog(
                    textAction: "Re-Register",
                    actionTextColor: Colors.red,
                    titleText: "Unsuccessfully",
                    titleTextColor: Colors.red,
                    pathImage: "assets/login/image_dialog.png",

                    fnc: (){
                      Navigator.pop(context);
                    },
                  )

              );
              // signUp(_usernameController.text,_passwordController.text);
            },),
            AlreadyHaveAccount(login:true,fnc: (){
              Navigator.pushNamed(
                  context,
                  '/login'
              );
            })
          ],
        )
    );
  }
}

