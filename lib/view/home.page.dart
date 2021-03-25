import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("teste", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
        child:
            Container(child: Text("teste2", style: TextStyle(fontSize: 20))));
  }
}
