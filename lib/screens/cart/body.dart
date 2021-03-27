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
  void initState() {
    // TODO: implement initState
    super.initState();
    // CartRes.getCart();
  }

  // List<ItemCart> listItemProduct = [
  //   ItemCart(
  //     pathImage: "assets/home/home_coffee.png",
  //     title: "Coffee Milk 31231",
  //     price: "\$2,99",
  //     qty: " x 2",
  //   ),
  //   ItemCart(
  //     pathImage: "assets/home/home_smoothie.png",
  //     title:
  //         "Smoothie strawberry sad sadsa sadsasd asdsa asda  dsafsa fsadfasdfsadsd",
  //     price: "\$3,99",
  //     qty: " x 1",
  //   ),
  //   ItemCart(
  //     pathImage: "assets/home/home_tea.png",
  //     title: "Tea",
  //     price: "\$4,99",
  //     qty: " x 3",
  //   ),
  //   ItemCart(
  //     pathImage: "assets/home/home_coffee.png",
  //     title: "Coffee Milk 31231",
  //     price: "\$2,99",
  //     qty: " x 2",
  //   ),
  //   ItemCart(
  //     pathImage: "assets/home/home_smoothie.png",
  //     title:
  //         "Smoothie strawberry sad sadsa sadsasd asdsa asda  dsafsa fsadfasdfsadsd",
  //     price: "\$3,99",
  //     qty: " x 1",
  //   ),
  //   ItemCart(
  //     pathImage: "assets/home/home_tea.png",
  //     title: "Tea",
  //     price: "\$4,99",
  //     qty: " x 3",
  //   )
  // ];

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
              if (snapshot.hasError)
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
    print("day la list cart : ${listItemCart["items"]}");

    listItemCart["items"].forEach((k,v) => listValue.add(v));
    print(listValue);
    return ListView.builder(
        itemCount: listValue.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key(listValue[index]["item"]["_id"]),
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