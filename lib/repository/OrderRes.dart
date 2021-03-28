


import 'package:http/http.dart' as http;
import 'dart:convert';
class OrderRes{

  static Map<String, String> headers = { 'Content-Type': 'application/json; charset=UTF-8'};

  static Future<Map>postOrder(Map itemCart)async{
    try{
      final res = await http.post('http://192.168.1.5/api/order',headers: headers,
          body: jsonEncode(itemCart)
      );

      updateCookie(res);

      if(res.statusCode == 200){
        Map data = jsonDecode(res.body);
        print(data);
        return data;
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


