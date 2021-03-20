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
        primaryColor: PrimaryColor,
        fontFamily: FontDefault,

      ),
      home: Login()
    );
  }
}
