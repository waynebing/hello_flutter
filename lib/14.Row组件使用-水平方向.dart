import 'package:flutter/material.dart';

/* 
  线性布局-Row
  
  
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
            title: Text('Row组件实例'),
          ),
          body: Container(
              width: double.infinity, //正无穷大
              height: double.infinity, //正无穷大
              color: const Color.fromARGB(255, 0, 221, 184),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(color: Colors.blue, width: 100, height: 100),
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                    // margin: EdgeInsets.only(top: 20, bottom: 20),
                  ),
                  Container(color: Colors.green, width: 100, height: 100),
                ],
              ))),
    );
  }
}
