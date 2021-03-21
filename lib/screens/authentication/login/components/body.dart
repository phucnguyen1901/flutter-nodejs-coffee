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
import 'package:chatapp/screens/main/body.dart';


class Body extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future<Map> signUp(String username, String password) async{
    print(username);
    print(password);
    try{
      Map body = {"username":username,"password":password};
      // final res = await http.get('https://blogphuc.herokuapp.com/api/get');
      final res = await http.post('http://192.168.1.4/api/register',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      print(res.body);
      if(res.statusCode == 200){
        Map data = jsonDecode(res.body);
        return data;
      }else{
        return {"message":"error"};
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
            controller: _usernameController,

          ),
          RoundedButton(text:'LOG IN',color: PrimaryColor,textColor: Colors.white,fnc: ()async{
            Map checkLogin = await signUp(_usernameController.text,_passwordController.text);
          checkLogin["message"] == "Save an user successfully" ?
          showDialog(
              context: context,
              child: AuthenticationDialog(
                textAction: "Sign Up Now",
                actionTextColor: Colors.green,
                titleText: "Successfully",
                titleTextColor: Colors.green,
                pathImage: "assets/login/image_dialog_success.png",
                fnc: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return Body();
                          }
                      )
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
          },),
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






