import 'package:flutter/material.dart';

/* 
  流式布局-Wrap
  ●作用:流式布局组件，当子组件在主轴方向上排列不下时，它会自动换行(或换列)
  
  Wrap组件更像是'Flex'组件加了换行特性

   注意:Column/Row/Flex内容超出均不会换行



*/

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  List<Widget> getList() {
    return List.generate(10, (index) {
      return Container(color: Colors.blue, width: 100, height: 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Wrap流式组件实例'),
          ),
          body: Container(
              padding: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromARGB(255, 0, 221, 184),
              child: Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                spacing: 10,
                runSpacing: 10,
                children: getList(),
              ))),
    );
  }
}
