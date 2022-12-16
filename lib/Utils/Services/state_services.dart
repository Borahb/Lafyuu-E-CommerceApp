import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lafyuu/Utils/app_urls.dart';


class StateService {


  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<bool> hasToken() async{
    var value = await storage.read(key: 'token');
    if (value != null){
      return true;
    }else{
      return false;
    }
  }


  Future<void> persistToken (String token)async{
    await storage.write(key: 'token', value: token);
  }


  Future<void> deleteToken ()async{
    storage.delete(key: 'token');
    storage.deleteAll();
  }


  Future<String> login(String username, String password)async{
    final response = await http.post(Uri.parse(AppUrl.login), body: {
      "username": username,
      "password":password,
    });

    var data = jsonDecode(response.body.toString());

    return data["token"];
  }


}