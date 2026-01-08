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

//父组件
class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> _list = [
    "鱼香肉丝",
    "宫保鸡丁",
    "麻婆豆腐",
    "回锅肉",
    "东坡肘子",
    "东坡肉",
    "鱼香茄子",
    "红烧肉",
    "红烧排骨",
    "西红柿炒鸡蛋",
    "麻辣豆腐",
    "鱼香肉丝",
    "宫保鸡丁",
    "麻婆豆腐",
    "回锅肉",
    "东坡肘子",
    "东坡肉",
    "鱼香茄子",
    "红烧肉",
    "红烧排骨",
    "西红柿炒鸡蛋",
    "麻辣豆腐"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: List.generate(_list.length, (index) {
          return Child(
            foodName: _list[index],
          );
        }),
      ),
    ));
  }
}

//子组件
class Child extends StatefulWidget {
  final String? foodName;
  Child({Key? key, required this.foodName}) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        widget.foodName ?? "",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
