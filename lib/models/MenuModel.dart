import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuModel{
  final String name, img, id,price;
  final List size;

  MenuModel(
      this.name,
      this.img,
      this.id,
      this.price,
      this.size);

  factory MenuModel.fromJson( Map<String,dynamic> json){
    return MenuModel(
        json['name'],
        json['img'],
        json['_id'],
        json['price'],
        json['size'],
    );
  }

}
