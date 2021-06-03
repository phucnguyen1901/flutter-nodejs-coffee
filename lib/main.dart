import 'package:chatapp/screens/authentication/register/components/register.dart';
import 'package:chatapp/screens/cart/cart_screen.dart';
import 'package:chatapp/screens/detailProduct/detailProduct.dart';
import 'package:chatapp/screens/home/home.dart';
import 'package:chatapp/screens/order/history.dart';
import 'package:chatapp/screens/order/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/menu/bloc/menu_bloc.dart';
import 'screens/authentication/login/components/login.dart';
import 'screens/order/detailHistory.dart';
import 'style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuBloc(),
      child: MaterialApp(
        title: 'Authentication',
        theme: ThemeData(
          primaryColor: midPinkColor,
          fontFamily: FontDefault,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => Login(),
          '/home': (context) => Home(),
          '/register': (context) => Register(),
          '/detail': (context) => DetailProDuct(),
          '/cart': (context) => Cart(),
          '/order': (context) => Order(),
          '/history': (context) => OrderHistory(),
          '/detailOrder': (context) => DetailOrder()
        },
      ),
    );
  }
}
