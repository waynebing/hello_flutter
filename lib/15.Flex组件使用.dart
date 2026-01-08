import 'package:flutter/material.dart';

/* 
  弹性布局-Flex
  ●作用:允许沿一个主轴(水平或垂直)排列其子组件，灵活地控制这些子组件在主轴上的尺寸比例和空间分配

  direction   Axis.horizontal/Axis.vertical   主轴方向，决定子组件的排列方向
  
  mainAxisAlignment   MainAxisAlignment   子组件在主轴方向上的对齐方式。

  crossAxisAlignment   CrossAxisAlignment   子组件在交叉轴方向上的对齐方式

  mainAxisSize  MainAxisSize   Flex 容器自身在主轴上的尺寸策略

  ●Expanded 与 Flexible 的区别: Expanded强制子组件填满所有剩余空间,Flexible根据自身大小调整,不强制占满空间

  
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
            title: Text('Flex组件实例'),
          ),
          body: Container(
              width: double.infinity, //正无穷大
              height: double.infinity, //正无穷大
              color: const Color.fromARGB(255, 0, 221, 184),
              child: Flex(
                //direction: Axis.horizontal, //水平方向
                direction: Axis.vertical, //垂直方向
                /* children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                          color: Colors.blue, width: 100, height: 100)),
                  Expanded(
                      flex: 1,
                      child: Container(
                          color: Colors.red, width: 100, height: 100)),
                ], */
                /* children: [
                  Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: Container(
                          color: Colors.blue, width: 100, height: 100)),
                  Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Container(
                          color: Colors.red, width: 100, height: 100)),
                ], */
                children: [
                  Container(color: Colors.blue, height: 100),
                  Expanded(child: Container(color: Colors.blueGrey)),
                  Container(color: Colors.red, height: 100),
                ],
              ))),
    );
  }
}
