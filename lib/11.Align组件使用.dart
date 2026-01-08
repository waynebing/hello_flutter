import 'package:flutter/material.dart';

/* 
  基础容器-Align-对齐组件
  ●作用:精确控制其子组件在父容器空间内的对齐位置
  ●alignmqnt(对齐方式):子组件在父容器内的对齐方式。
  ●widthFactor(宽度因子):Align的宽度将是子组件宽度乘以该因子
  ●heightFactor(高度因子):Align的高度将是子组件高度乘以该因子 
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
          title: Text('Align组件实例'),
        ),
        body: Align(
          // alignment: Alignment.bottomCenter,
          // widthFactor: 2,
          // heightFactor: 2,
          child: Icon(
            Icons.star,
            size: 150,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
