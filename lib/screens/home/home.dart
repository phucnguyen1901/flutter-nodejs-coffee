import 'package:chatapp/blocs/menu/bloc/menu_bloc.dart';
import 'package:chatapp/models/MenuModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'body.dart';
import 'bottom.dart';

class Home extends StatefulWidget {
  // final List<MenuModel> listMenu;

  // const Home({Key key, this.listMenu}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => MenuBloc(),
    //   child: Scaffold(body: Body(listMenu: listMenu,), bottomNavigationBar: Bottom()),
    // );
    return Scaffold(body: Body(), bottomNavigationBar: Bottom());
  }
}
