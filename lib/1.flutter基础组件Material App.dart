import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
      title: "Flutter组件初体验",
      // theme: ThemeData(scaffoldBackgroundColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "头部区域",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: Center(
          child: Text(
            "中部区域",
            style: TextStyle(color: Colors.blue),
          ),
        )),
        bottomNavigationBar: Container(
            height: 80,
            child: Center(
              child: Text(
                "底部区域",
                style: TextStyle(color: Colors.amber),
              ),
            )),
        /* floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ), */
      )));
}
