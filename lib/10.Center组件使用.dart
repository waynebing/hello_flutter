import 'package:flutter/material.dart';

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
              title: Text('Center代码实例'),
            ),
            body: Center(
              child: Container(
                // alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.amber, width: 3),
                ),
                child: Center(
                    child: Text(
                  'Hello,Center',
                )),
              ),
            )));
  }
}
