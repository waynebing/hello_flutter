import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("无状态组件的构造函数");
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Text("无状态组件"),
          ),
        ),
      ),
    );
  }
}
