import 'package:chatapp/components/ItemProduct.dart';
import 'package:chatapp/components/itemCart.dart';
import 'package:chatapp/models/Card.dart';
import 'package:chatapp/style.dart';

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // List<ItemProduct> listProduct (size){
  //   List<ItemProduct> list = [
  //     ItemProduct(pathImage:"assets/home/home_smoothie.png",size: size, nameItem: "Coffee Milk", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered",
  //       fnc:(){
  //         Navigator.pushNamed(context, '/detail');
  //       },),
  //     ItemProduct(pathImage:"assets/home/home_tea.png",size: size, nameItem: "Coffee Coffee", description: "Umbalasiba",),
  //     ItemProduct(pathImage:"assets/login/icon_user.png",size: size, nameItem: "Coffee tonay", description: "Umbalasiba",),
  //   ];
  //   return list;
  //
  // }
  List<ItemCart> listItemProduct = [
    ItemCart(
      pathImage: "assets/home/home_coffee.png",
      title: "Coffee Milk 31231",
      price: "\$2,99",
      qty: " x 2",
    ),
    ItemCart(
      pathImage: "assets/home/home_smoothie.png",
      title:
          "Smoothie strawberry sad sadsa sadsasd asdsa asda  dsafsa fsadfasdfsadsd",
      price: "\$3,99",
      qty: " x 1",
    ),
    ItemCart(
      pathImage: "assets/home/home_tea.png",
      title: "Tea",
      price: "\$4,99",
      qty: " x 3",
    ),
    ItemCart(
      pathImage: "assets/home/home_coffee.png",
      title: "Coffee Milk 31231",
      price: "\$2,99",
      qty: " x 2",
    ),
    ItemCart(
      pathImage: "assets/home/home_smoothie.png",
      title:
          "Smoothie strawberry sad sadsa sadsasd asdsa asda  dsafsa fsadfasdfsadsd",
      price: "\$3,99",
      qty: " x 1",
    ),
    ItemCart(
      pathImage: "assets/home/home_tea.png",
      title: "Tea",
      price: "\$4,99",
      qty: " x 3",
    )
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height,
        width: size.width,
        child: ListView.builder(
          itemCount: listItemProduct.length,
          itemBuilder: (context, index) {
            return Dismissible(
                key: Key(listItemProduct[index].title),
                background: Container(
                  // height: size.height,
                  width: size.width,
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
                  size: size,
                  pathImage: listItemProduct[index].pathImage,
                  title: listItemProduct[index].title,
                  price: listItemProduct[index].price,
                  qty: listItemProduct[index].qty,
                ));
          },
        ));
  }
}
