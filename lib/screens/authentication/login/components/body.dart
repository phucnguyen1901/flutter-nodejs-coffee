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
  Future<Map> signIn(String username, String password) async{

    try{
      Map body = {"username":username,"password":password};
      // final res = await http.get('https://blogphuc.herokuapp.com/api/get');
      final res = await http.post('http://192.168.1.5/api/login',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      print(res.body);
      if(res.statusCode == 200){
        Map data = jsonDecode(res.body);
        if(data["message"] == "Authenticate unsuccessfully"){
          print("Sai password");
          return null;
        }
        print(data);
        return data;

      }else{
        return null;
      }
    }catch(e){
      print('error');
      print(e);
    }
  }

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
            Map checkLogin = await signIn(_usernameController.text,_passwordController.text);
            print(checkLogin);
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






