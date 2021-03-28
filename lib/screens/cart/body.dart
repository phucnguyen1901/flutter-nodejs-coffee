import 'package:chatapp/components/ItemProduct.dart';
import 'package:chatapp/components/itemCart.dart';
import 'package:chatapp/models/Card.dart';
import 'package:chatapp/repository/CartRes.dart';
import 'package:chatapp/style.dart';

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
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
        )
    );
  }

  ListView ListItemCart(Map listItemCart) {
    List listValue = [];
    List keyToDismissible = [];
    print("day la list cart : ${listItemCart["items"]}");

    listItemCart["items"].forEach((k,v) => listValue.add(v));
    listItemCart["items"].forEach((k,v) => keyToDismissible.add(k));
    return ListView.builder(
        itemCount: listValue.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key(listValue[index]["item"]["_id"]),
              onDismissed: (direction){
                CartRes.removeCart(keyToDismissible[index]);
                // print("Day la cart sau khi xoa $cart");
              },
              background: Container(
                // height: size.height,
                // width: size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                child: Container(
                    padding: EdgeInsets.only(left: 0),
                    decoration: BoxDecoration(
                        color: lightPinkColor,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/home/delete_button.png")))),
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