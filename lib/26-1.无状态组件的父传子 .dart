import 'package:flutter/material.dart';

/* 
组件通信-父传子(构造函数传参数)
●步骤:
1.子组件定义接收属性
2.子组件在构造函数中接收参数
3.父组件传递属性给子组件
4.有状态组件在'对外的类"接收属性，'对内的类'通过widget对象获取对应属性
5.注意4:子组件定义接收属性需要使用final关键字-因为属性由父组件决定，子组件不能随意更改


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
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  "父组件",
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                ),
                Child(
                  message: '老高',
                )
              ],
            )),
      ),
    );
  }
}

//无状态组件的子组件
class Child extends StatelessWidget {
  //定义属性
  final String? message;
  //构造函数中接收参数
  const Child({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '子组件-$message',
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}
