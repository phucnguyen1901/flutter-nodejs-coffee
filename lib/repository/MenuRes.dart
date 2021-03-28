


import 'package:chatapp/models/MenuModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuRes{

  static Future<List>getMenu()async{
    try{
      final res = await http.get('http://192.168.1.5/api/home');

      if(res.statusCode == 200){
        List data = jsonDecode(res.body);

        // List<MenuModel> result = data.map((e) => MenuModel.fromJson(e));
        return data;
      }
    }catch(e){
      print('error');
      print(e);
    }
  }
}


