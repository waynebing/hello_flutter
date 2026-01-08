import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

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
            /* child: GestureDetector(
            //点击事件
            onTap: () {
              print('点击了中部区域');
            },
            onDoubleTap: () {
              print('双击了中部区域');
            },
            child: Text("中部区域"),
          ) */
            child: TextButton(
                onPressed: () {
                  print('按钮的点击事件');
                },
                child: Text('按钮')),
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
