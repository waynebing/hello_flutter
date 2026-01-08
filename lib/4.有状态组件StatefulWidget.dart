import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

//有状态组件  第一个类 对外
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

//第二个类 内部类 负责管理数据 处理业务逻辑 并且渲染视图
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter组件初体验 - 有状态组件",
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
