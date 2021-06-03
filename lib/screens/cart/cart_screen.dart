import 'package:chatapp/components/dialog.dart';
import 'package:chatapp/components/itemCart.dart';
import 'package:chatapp/repository/CartRes.dart';
import 'package:flutter/material.dart';

import 'body.dart';
import 'bottom.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _currentIndex = 1;
  Map _Cart = new Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartRes.getCart().then((value) => {
          setState(() {
            _Cart = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Text(
                "Your Cart",
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
              Text(
                _Cart != null ? "${_Cart["totalQty"]} items" : "0 item",
                style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Exo",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            height: size.height,
            width: size.width,
            child: FutureBuilder<Map>(
              future: CartRes.getCart(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Loading...'));
                } else {
                  if (snapshot.data == null)
                    return Center(child: Text('Empty Cart...'));
                  else
                    return ListItemCart(snapshot.data);
                }
              },
            )),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 35.0,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_outlined),
                label: _Cart != null
                    ? _Cart["totalPrice"] != null
                        ? _Cart["totalPrice"] < 0
                            ? "0.0 \$"
                            : "Cash: ${_Cart["totalPrice"].toStringAsFixed(2)} \$"
                        : "0.0 \$"
                    : "0.0 \$",
                backgroundColor: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            switch (index) {
              case 0:
                {
                  Navigator.pushNamed(context, "/home");
                }
                break;

              case 1:
                {
                  _Cart != null && _Cart["totalPrice"] > 0
                      ? Navigator.pushNamed(context, "/order", arguments: _Cart)
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AuthenticationDialog(
                              textAction: "Buy Now",
                              actionTextColor: Colors.green,
                              titleText: "Empty Cart",
                              titleTextColor: Colors.green,
                              pathImage: "assets/login/image_dialog.png",
                              fnc: () {
                                Navigator.pushNamed(context, '/home');
                              },
                            );
                          });
                }
                break;

              default:
                {
                  //statements;
                }
                break;
            }
          },
        ));
  }

  ListView ListItemCart(Map listItemCart) {
    List listValue = [];
    List keyToDismissible = [];
    // print("day la list cart : ${listItemCart["items"]}");

    listItemCart["items"].forEach((k, v) => listValue.add(v));
    listItemCart["items"].forEach((k, v) => keyToDismissible.add(k));
    return ListView.builder(
      itemCount: listValue.length,
      itemBuilder: (context, index) {
        return Dismissible(
            key: Key(listValue[index]["item"]["_id"]),
            onDismissed: (direction) {
              CartRes.removeCart(keyToDismissible[index]).then((value) => {
                    setState(() {
                      _Cart["totalPrice"] = value["totalPrice"];
                    })
                  });
            },
            background: Container(
              // height: size.height,
              // width: size.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              child: Container(
                  padding: EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      image: DecorationImage(
                          image: AssetImage("assets/home/delete_button.png")))),
            ),
            child: ItemCart(
              pathImage: listValue[index]["item"]["img"].toString(),
              title: listValue[index]["item"]["name"].toString(),
              price: listValue[index]["item"]["price"].toString(),
              qty: listValue[index]["qty"].toString(),
            ));
      },
    );
  }
}
