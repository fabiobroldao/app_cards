import 'package:app_cards/model/card.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class Cards {
  static Future<List<Card>> getCards() async {
    Dio dio = new Dio();

    dio.options.headers["authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjE2NjMzMzc4LCJleHAiOjE2MTY3MTk3Nzh9.Kq_gQmYIqgZOtnF3xVQz0KGsxXGyovBWzrHbQDeVKII";
    try {
      var response =
          await dio.get('https://api-cards-growdev.herokuapp.com/cards');
      print(response.data);
      return (response.data as List)
          .map((cards) => Card.fromJson(cards))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  static Future<List<Card>> getCard(int id) async {
    Dio dio = new Dio();

    dio.options.headers["authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjE2NjMzMzc4LCJleHAiOjE2MTY3MTk3Nzh9.Kq_gQmYIqgZOtnF3xVQz0KGsxXGyovBWzrHbQDeVKII";
    try {
      var response =
          await dio.get('https://api-cards-growdev.herokuapp.com/cards/$id');
      print(response.data);
      return (response.data as List)
          .map((cards) => Card.fromJson(cards))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  static Future<Card> newCard(String title, String content) async {
    Dio dio = new Dio();
    Map params = {
      "title": title,
      "content": content,
    };

    var _body = json.encode(params);

    dio.options.headers["authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjE2NjMzMzc4LCJleHAiOjE2MTY3MTk3Nzh9.Kq_gQmYIqgZOtnF3xVQz0KGsxXGyovBWzrHbQDeVKII";

    try {
      var response = await dio
          .post('https://api-cards-growdev.herokuapp.com/cards', data: _body);

      print(response.data);
      return response.data;
    } catch (err) {
      print(err);
    }
  }
}
