import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuModel {
  final String name, img, id;
  final double price;
  final List size;

  MenuModel(this.name, this.img, this.id, this.price, this.size);

  MenuModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'],
        id = json['_id'],
        price = json['price'],
        size = json['size'];
}
