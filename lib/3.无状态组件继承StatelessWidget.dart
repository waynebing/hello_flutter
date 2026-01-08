import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

//无状态组件继承StatelessWidget并实现build方法，build返回一个widget，纯展示型组件，没有用户交互操作
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter组件初体验 - 无状态组件",
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
              style: TextStyle(color: const Color.fromARGB(255, 207, 12, 29)),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: Center(
            child: Text(
              "底部区域",
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ),
      ),
    );
  }
}
