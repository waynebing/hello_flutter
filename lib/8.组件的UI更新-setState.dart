import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Row(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    count -= 1;
                  });
                },
                child: Text('减')),
            Text(count.toString()),
            TextButton(
                onPressed: () {
                  setState(() {
                    count += 1;
                  });
                },
                child: Text('加'))
          ],
        ),
      )),
    );
  }
}
