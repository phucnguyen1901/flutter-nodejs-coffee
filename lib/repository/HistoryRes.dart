import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryRes{

  static Map<String, String> headers = { 'Content-Type': 'application/json; charset=UTF-8'};

  static Future<List>orderHistory(String idUser)async{
    try{
      final res = await http.get('https://ordercoffeevn.herokuapp.com/api/historyOrder/$idUser', headers: headers);
      updateCookie(res);
      if(res.statusCode == 200){
        Map data = jsonDecode(res.body);
        // print(data);
        return data["orders"];
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


