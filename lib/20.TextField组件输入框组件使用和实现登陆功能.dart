import 'package:flutter/material.dart';

/* 

  必须使用有状态组件


  作用:实现文本输入功能的核心组件


  controller   文本编辑器控制器，用于获取、设置文档内容及监听变化

  decortation   当时输入框的外观、如标签、提示文字、图标、边框等

  style   定义输入文本的样式

  maxLines  最大行数

  onChanged  输入内容发生变化时执行的回调函数

  onSubmitted   用户提交输入时的回调函数



*/

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController usernameController = TextEditingController(); //账号控制器
  TextEditingController passwordController = TextEditingController(); //密码控制器

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('登陆')),
          body: Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                    controller: usernameController,
                    onChanged: (val) {
                      print(val);
                    },
                    onSubmitted: (val) {
                      print(val);
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20), //内容边距
                        fillColor: Colors.amber,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: '请输入用户名')),
                SizedBox(height: 15),
                TextField(
                    controller: passwordController,
                    obscureText: true, //不显示实际内容
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20), //内容边距
                        fillColor: Colors.lightBlueAccent,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: '请输入密码')),
                SizedBox(height: 15),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {
                        print(
                            "登陆 - ${usernameController.text} - ${passwordController.text}");
                      },
                      child: Text(
                        '登陆',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          )),
    );
  }
}
