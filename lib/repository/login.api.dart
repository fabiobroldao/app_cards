import 'dart:collection';
import 'dart:convert';

import 'package:app_cards/pages/user.dart';
import 'package:http/http.dart' as http;

class LoginAPI {
  static Future<User> login(String user, String password) async {
    var url = Uri.parse('https://api-cards-growdev.herokuapp.com/login');

    var header = {"content-type": "application/json"};
    Map params = {
      "email": user,
      "password": password,
    };
    var usuario;

    var _body = json.encode(params);
    print("json enviado : $_body");

    var response = await http.post(
      url,
      headers: header,
      body: _body,
    );
    print('Response status: ${response.statusCode}');

    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      usuario = User.fromJson(mapResponse);
    } else {
      usuario = null;
    }

    return usuario;
  }
}
