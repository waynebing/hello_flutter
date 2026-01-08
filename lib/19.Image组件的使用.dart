import 'package:flutter/material.dart';

/* 


 ●作用:在用户界面中显示图片的核心部件

  Image.asset()  加载项目资源目录(assets)中的图片。需要在pubspec.yaml文件中声明资源路径

  Image.network()  直接从网络地址加载图片

  Image.file()   加载设备本地存储中的图片文件

  Image.memory()   加载内存中的图片数据


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
              title: Text('Image组件实例'),
            ),
            body: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              color: Colors.amber,
              child: Image.network(
                "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              /* child: Image.asset(
                'lib/images/1.png',
                width: 100,
                height: 100,
              ), */
            )));
  }
}
