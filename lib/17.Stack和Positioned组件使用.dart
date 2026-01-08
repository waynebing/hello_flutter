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
            title: Text('Stack组件实例'),
          ),
          body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.amber,
              child: Stack(
                children: [
                  Container(width: 200, height: 200, color: Colors.blueGrey),
                  Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        color: Colors.red,
                        width: 50,
                        height: 50,
                      )),
                  Positioned(
                      right: 10,
                      bottom: 10,
                      child: Container(
                        color: Colors.blue,
                        width: 50,
                        height: 50,
                      )),
                ],
              )
              //Stack的基础用法
              /* child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.blueGrey,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                ],
              ) */
              )),
    );
  }
}
