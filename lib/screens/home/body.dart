import 'package:chatapp/blocs/menu/bloc/menu_bloc.dart';
import 'package:chatapp/components/ElementMenu.dart';
import 'package:chatapp/components/ItemProduct.dart';
import 'package:chatapp/models/MenuModel.dart';
import 'package:chatapp/repository/MenuRes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  final List<MenuModel> listMenu;

  const Body({Key key, this.listMenu}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List itemMenu;
  String user;
  bool _checkLogin = false;

  // MenuBloc _menuBloc = BlocProvider.of<MenuBloc>(context);
  // MenuBloc _menuBloc;

  @override
  void initState() {
    super.initState();
    // _menuBloc.add(MenuLoad());
    SharedPreferences.getInstance().then((value) => {
          setState(() {
            user = value.getString("user");
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // MenuBloc _menuBloc = BlocProvider.of<MenuBloc>(context);
    // _menuBloc.add(MenuLoad());
    print(widget.listMenu);
    return _checkLogin
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
                Text("Log out ....",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ))
              ],
            ))
        : Container(
            height: size.height,
            width: size.width,
            child: ListView(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text("Hi $user!",
                                style: user.toString().length < 30
                                    ? TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: "Exo",
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: "Exo",
                                        fontWeight: FontWeight.bold))),
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _checkLogin = !_checkLogin;
                                    });
                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child: Center(
                                      child: Text("Log out",
                                          style: TextStyle(fontSize: 12.0))),
                                )
                                // ),
                                ),
                          )),
                    ]),
                // SizedBox(height: 20.0,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("This Week ",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Exo",
                          fontWeight: FontWeight.bold)),
                ),
                // Container(
                //     margin: EdgeInsets.only(top: 20.0),
                //     height: size.height * 0.47,
                //     child: ListMenuHome(widget.listMenu)),
                BlocBuilder<MenuBloc, MenuState>(
                  builder: (context, state) {
                    if (state is MenuInitial) {
                      return Text("Menu Initial");
                    } else if (state is MenuLoading) {
                      return CircularProgressIndicator();
                    } else if (state is MenuLoaded) {
                      return Container(
                          margin: EdgeInsets.only(top: 20.0),
                          // color: Colors.blue,
                          height: size.height * 0.47,
                          child: ListMenuHome(state.props[0])
                          // child:FutureBuilder<List>(
                          //   future:  MenuRes.getMenu(),
                          //   builder: (context,snapshot){
                          //     if( snapshot.connectionState == ConnectionState.waiting){
                          //       return  Center(child: Text('Please wait its loading...'));
                          //     }else{
                          //       if (snapshot.hasError)
                          //         return Center(child: Text('Error: ${snapshot.error}'));
                          //       else
                          //         return ListMenuHome(snapshot.data);
                          //     }
                          //   },
                          // )
                          );
                    } else {
                      return Text("Not Load");
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    ElementMenu(
                      size: size,
                      pathImage: "assets/home/home_coffee.png",
                      text: "Coffee",
                    ),
                    ElementMenu(
                      size: size,
                      pathImage: "assets/home/home_smoothie.png",
                      text: "Smoothie",
                    ),
                    ElementMenu(
                      size: size,
                      pathImage: "assets/home/home_tea.png",
                      text: "Tea",
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  ListView ListMenuHome(List<MenuModel> listProduct) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listProduct.length,
      itemBuilder: (context, index) {
        return ItemProduct(
          name: listProduct[index].name,
          description: listProduct[index].id,
          img: listProduct[index].img,
          price: listProduct[index].price,
          fnc: () {
            Navigator.pushNamed(context, '/detail', arguments: {
              "_id": listProduct[index].id,
              "name": listProduct[index].name,
              "img": listProduct[index].img,
              "price": listProduct[index].price,
            });
            // CartRes.postCart(
            //   {
            //   "_id": listProduct[index]["_id"].toString(),
            //   "name":listProduct[index]["name"].toString(),
            //   "img":listProduct[index]["img"].toString(),
            //   "price": listProduct[index]["price"],
            //   }
            // );
          },
        );
      },
    );
  }
}
