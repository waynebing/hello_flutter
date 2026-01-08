import 'package:flutter/material.dart';

/* 
  Stack组件

  ●作用:层叠布局组件，允许你将多个子组件按照Z轴(深度方向)进行叠加排列。

  ●搭档:Positioned组件是 Stack的黄金搭档，对子组件进行精确定位控制。Positioned必须作为 Stack的直接子组件。
  Positioned通过left、right、top、bottom 来将子组件“钉”在 Stack的某个角落或边缘

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
              title: Text('Text和TextSpan组件实例'),
            ),
            body: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                color: Colors.amber,
                child: Text.rich(
                  TextSpan(
                      text: "Hello",
                      children: [
                        TextSpan(
                            text: "   Flutter",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ],
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ))));
  }
}
