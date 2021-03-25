import 'dart:convert';

import 'package:app_cards/model/user.dart';
import 'package:dio/dio.dart';

class LoginAPI {
  static Future<User> login(String user, String password) async {
    Map params = {
      "email": user,
      "password": password,
    };
    var usuario;

    var _body = json.encode(params);

    Response response;
    Dio dio = new Dio();

    response = await dio.post('https://api-cards-growdev.herokuapp.com/login',
        data: _body);

    print("json enviado : $_body");
    print(response);

    print('Response status: ${response.statusCode}');

    Map mapResponse = json.decode(response.toString());

    if (response.statusCode == 200) {
      usuario = User.fromJson(mapResponse);
    } else {
      usuario = null;
    }

    return usuario;
  }
}
