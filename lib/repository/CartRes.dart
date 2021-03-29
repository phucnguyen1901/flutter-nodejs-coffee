





import 'package:http/http.dart' as http;
import 'dart:convert';

class CartRes{

  static Map<String, String> headers = { 'Content-Type': 'application/json; charset=UTF-8'};

  static Future<Map>getCart()async{
    try{
      final res = await http.get('https://ordercoffeevn.herokuapp.com/api/cart', headers: headers);
      updateCookie(res);
      if(res.statusCode == 200){
        Map data = jsonDecode(res.body);
        // print(data);
        return data;
      }
    }catch(e){
      print('error');
      print(e);
    }
  }

  static Future<Map>removeCart(String idItem)async{
    try{
      final res = await http.delete("https://ordercoffeevn.herokuapp.com/api/removeCart/$idItem",headers: headers,
      );

      updateCookie(res);

      if(res.statusCode == 200){
        Map data = jsonDecode(res.body);
        return data;

      }
    }catch(e){
      print('error');
      print(e);
    }
  }

  static Future<void>postCart(Map itemCart)async{
    try{
      final res = await http.post('https://ordercoffeevn.herokuapp.com/api/updateCart',headers: headers,
        body: jsonEncode(itemCart)
      );

      updateCookie(res);

      if(res.statusCode == 200){
        // Map data = jsonDecode(res.body);
        // return data;
      }
    }catch(e){
      print('error');
      print(e);
    }
  }

  static void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
      (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}


