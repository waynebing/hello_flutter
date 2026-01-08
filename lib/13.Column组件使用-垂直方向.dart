import 'package:flutter/material.dart';

/* 
  线性布局-Column
  ●作用:用于垂直排列其子组件的核心布局容器
  mainAxisAlignment    控制子组件在主轴(垂直方向)上的排列方式，如顶部对齐、居中或均匀分布   上下方向
  crossAxisAlignment    控制子组件在交叉轴(水平方向)上的对齐方式，如左对齐、右对齐或拉伸填满。  左右方向
  mainAxisSize       决定Column本身在垂直方向上的尺寸策略:是占满所有可用空间(max)还是仅仅包裹子组件内容(min)

  注意事项:Column本身不支持滚动，如果内容超出，需要使用ListView或者SingleChildscrollView包裹
  
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
            title: Text('Column组件实例'),
          ),
          body: Container(
              width: double.infinity, //正无穷大
              color: const Color.fromARGB(255, 0, 221, 184),
              //child: Container(color: Colors.blue))),
              child: Column(
                /*mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,*/
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(color: Colors.blue, width: 100, height: 100),
                  // SizedBox(height: 20),
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                  ),
                  // SizedBox(height: 20),
                  Container(color: Colors.green, width: 100, height: 100),
                ],
              ))),
    );
  }
}
