import 'package:app_cards/repository/get_list.services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GrowDevCards", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  var context;

  _body() {
    return Center(
        child: Container(
            child: ListView(
      children: <Widget>[
        _raisedButton("Lista de Cards", Colors.orange, context),
        _raisedButton2("Lista de Cards", Colors.orange, context),
        _raisedButton3("Listar 1 card", Colors.orange, context)
      ],
    )));
  }
}

_raisedButton(String texto, Color cor, BuildContext context) {
  return RaisedButton(
    color: cor,
    child: Text(texto,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        )),
    onPressed: () {
      _clickButton(context);
    },
  );
}

_raisedButton2(String texto, Color cor, BuildContext context) {
  return RaisedButton(
    color: cor,
    child: Text(texto,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        )),
    onPressed: () {
      _clickButton2(context);
    },
  );
}

_raisedButton3(String texto, Color cor, BuildContext context) {
  return RaisedButton(
    color: cor,
    child: Text(texto,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        )),
    onPressed: () {
      _clickButton3(context);
    },
  );
}

void _clickButton(BuildContext context) async {
  var usuario = await Cards.getCards();
  print(usuario);
}

void _clickButton2(BuildContext context) async {
  String title = "Titulo do card";
  String content = "Conteudo do card";

  var usuario = await Cards.newCard(title, content);
  print(usuario);
}

void _clickButton3(BuildContext context) async {
  int id = 25;

  var usuario = await Cards.getCard(id);
  print(usuario);
}
