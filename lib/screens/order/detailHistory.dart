import 'package:chatapp/components/itemCart.dart';
import 'package:chatapp/repository/HistoryRes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DetailOrder extends StatefulWidget {
  @override
  _DetailOrderState createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map listDetailOrder = ModalRoute.of(context).settings.arguments;
    List listValue = [];
    listDetailOrder.forEach((key, value) {
      listValue.add(value);
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("Order History"),
          centerTitle: true,
        ),
        body:Container(
            height: size.height,
            width: size.width,
            child:ListView.builder(
              itemCount: listValue.length,
              itemBuilder: (context, index) {
                // return Text("A");
                return ItemCart(
                  pathImage: listValue[index]["item"]["img"].toString(),
                  title: listValue[index]["item"]["name"].toString(),
                  price: listValue[index]["item"]["price"].toString(),
                  qty: listValue[index]["qty"].toString(),
                );
              },
            )
        )
    );
  }
}
