import 'package:flutter/material.dart';

/* 
  EdgeInsets.all(20) 是设置上下左右四个内边距为20 
  EdgeInsets.only(left:20) 是设置1个左边的内边距为20 
  EdgeInsets.symmetric(horizontal: 20,vertical: 30) 是设置水平左右方向和上下方向的对应值

*/

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Padding组件实例'),
          ),
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              //color: Colors.amber,
              decoration: BoxDecoration(color: Colors.amber),
              //child: Container(color: Colors.blue))),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(color: Colors.blue),
              ))),
    );
  }
}
