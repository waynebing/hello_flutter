import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        width: 200,
        height: 200,
        transform: Matrix4.rotationZ(0.05), //弧度
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.amber, width: 3),
        ),
        child: Text('Hello,Container',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      )),
    );
  }
}
