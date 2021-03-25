



import 'package:http/http.dart' as http;
import 'dart:convert';

class Authentication{

  final String name, username,_id;

  Authentication(this.name,this.username,this._id);

  // void user(){
  //   getHome(username,password)
  //   this.username
  // }

  Future<Map> getHome(String username, String password) async{
  try{
  Map body = {"username":username,"password":password};
// final res = await http.get('https://blogphuc.herokuapp.com/api/get');
  final res = await http.post('http://192.168.1.5/api/login',
    headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(body),
    );
    print(res.body);
    if(res.statusCode == 200){
    Map data = jsonDecode(res.body);
    if(data["message"] == "Sign in not success"){
        print("Sai password");
         return null;
    }
      print(data);
      return data;
      }else{
        return null;
      }
    }catch(e){
        print('error');
        print(e);
    }
  }

}


