
import 'package:chatapp/screens/authentication/register/components/register.dart';
import 'package:chatapp/screens/cart/cart_screen.dart';
import 'package:chatapp/screens/detailProduct/detailProduct.dart';
import 'package:chatapp/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'screens/authentication/login/components/login.dart';
import 'style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Authentication',
      theme: ThemeData(
        primaryColor: midPinkColor,
        fontFamily: FontDefault,
      ),
      initialRoute: '/home',
      routes: {
        '/login' : (context) => Login(),
        '/home' : (context) => Home(),
        '/register' : (context) => Register(),
        '/detail' : (context) => DetailProDuct(),
        '/cart' : (context) => Cart()
      },
    );
  }
}
