import 'package:flutter/material.dart';

/* 
组件通信-子传父(回调函数)

步骤:
1.父组件传递一个函数给子组件
2.子组件调用该函数
3.父组件通过回调函数获取参数


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
            index: index,
            delFood: (int i) {
              print("成功调用到父组件的函数$i");
              setState(() {
                _list.removeAt(i);
              });
            },
          );
        }),
      ),
    ));
  }
}

//子组件
class Child extends StatefulWidget {
  final String? foodName;
  final int? index;
  final Function(int index) delFood;
  Child(
      {Key? key,
      required this.foodName,
      required this.index,
      required this.delFood})
      : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          widget.foodName ?? "",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      IconButton(
        onPressed: () {
          //print('当前点击索引${widget.index}');
          widget.delFood(widget.index ?? 0);
        },
        icon: Icon(Icons.delete),
        color: Colors.white,
      )
    ]);
  }
}
