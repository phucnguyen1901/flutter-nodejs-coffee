import 'package:chatapp/blocs/menu/bloc/menu_bloc.dart';
import 'package:chatapp/models/MenuModel.dart';
import 'package:chatapp/models/UserModel.dart';
import 'package:chatapp/repository/MenuRes.dart';
import 'package:chatapp/repository/UserRes.dart';
import 'package:chatapp/screens/home/home.dart';
import 'package:chatapp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/rounded_button.dart';
import 'package:chatapp/components/full_text_field.dart';
import 'package:chatapp/components/alreadyHaveAccount.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../register/components/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chatapp/components/dialog.dart';
// import 'package:chatapp/screens/home/home.dart';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _loading = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MenuBloc _menuBloc = BlocProvider.of<MenuBloc>(context);
    _menuBloc.add(MenuLoad());
    return _loading
        ? Container(
            height: size.height,
            width: size.width,
            color: Colors.deepPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitRing(
                  color: Theme.of(context).primaryColor,
                  size: 120.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text("Đợi chút xíu , server free nên load lần đầu chậm",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )),
                Text("Còn không zô được thì lỗi bà nó rồi",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text("Wait a minute",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ))
              ],
            ))
        : SingleChildScrollView(
            child: Container(
                color: Colors.deepPurple,
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: size.width * 0.8,
                        height: size.height * 0.3,
                        child: Image.asset("assets/login/bg_login.png")),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      width: size.width * 0.9,
                      height: size.height * 0.02,
                      decoration: BoxDecoration(
                          color: PrimaryColor,
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    FullTextField(
                      hintText: 'Username',
                      icon: Icons.person,
                      iconColor: PrimaryColor,
                      controller: _usernameController,
                      maxLine: 1,
                    ),
                    FullTextField(
                      obscureText: !_passwordVisible,
                      hintText: 'Password',
                      icon: Icons.lock,
                      iconColor: PrimaryColor,
                      iconEnd: Icons.visibility,
                      controller: _passwordController,
                      maxLine: 1,
                      iconButton: IconButton(
                        icon: _passwordVisible
                            ? Icon(
                                Icons.visibility,
                                color: PrimaryColor,
                              )
                            : Icon(Icons.visibility_off, color: PrimaryColor),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    // BlocBuilder<MenuBloc, MenuState>(
                    //   builder: (context, state) {
                    //     if (state is MenuLoaded) {
                    //       List<MenuModel> result = state.props[0];
                    //       return RoundedButton(
                    //         text: 'LOG IN',
                    //         color: PrimaryColor,
                    //         textColor: Colors.white,
                    //         fnc: () async {
                    //           // UserModel checkLogin = await UserRes.loginUser(_usernameController.text,_passwordController.text);
                    //           // setState(() {
                    //           //   _loading = !_loading;
                    //           // });

                    //           UserModel checkLogin = await UserRes.loginUser(
                    //               _usernameController.text,
                    //               _passwordController.text);

                    //           // checkLogin == null
                    //           //     ? setState(() {
                    //           //         _loading = !_loading;
                    //           //       })
                    //           //     : null;
                    //           // _menuBloc.add(MenuLoad());
                    //           checkLogin != null
                    //               // ? Navigator.pushNamed(context, '/home')
                    //               ? Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         Home(listMenu: result),
                    //                   ),
                    //                 )
                    //               : showDialog(
                    //                   context: context,
                    //                   builder: (BuildContext context) {
                    //                     return AuthenticationDialog(
                    //                       textAction: "Re-Login",
                    //                       actionTextColor: Colors.red,
                    //                       titleText: "Login Unsuccessful",
                    //                       titleTextColor: Colors.red,
                    //                       pathImage:
                    //                           "assets/login/image_dialog.png",
                    //                       fnc: () {
                    //                         Navigator.pop(context);
                    //                       },
                    //                     );
                    //                   });
                    //         },
                    //       );
                    //     } else {
                    //       return Text("ABC");
                    //     }
                    //   },
                    // ),
                    RoundedButton(
                      text: 'LOG IN',
                      color: PrimaryColor,
                      textColor: Colors.white,
                      fnc: () async {
                        // UserModel checkLogin = await UserRes.loginUser(_usernameController.text,_passwordController.text);
                        setState(() {
                          _loading = !_loading;
                        });
                        UserModel checkLogin = await UserRes.loginUser(
                            _usernameController.text, _passwordController.text);
                        print(checkLogin);

                        checkLogin == null
                            ? setState(() {
                                _loading = !_loading;
                              })
                            : null;
                        _menuBloc.add(MenuLoad());
                        checkLogin != null
                            ? Navigator.pushNamed(context, '/home')
                            // ? Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Home(),
                            //     ),
                            //   )
                            : showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AuthenticationDialog(
                                    textAction: "Re-Login",
                                    actionTextColor: Colors.red,
                                    titleText: "Login Unsuccessful",
                                    titleTextColor: Colors.red,
                                    pathImage: "assets/login/image_dialog.png",
                                    fnc: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                });
                      },
                    ),
                    AlreadyHaveAccount(fnc: () {
                      Navigator.pushNamed(context, '/register');
                    })
                  ],
                )),
          );
  }
}
