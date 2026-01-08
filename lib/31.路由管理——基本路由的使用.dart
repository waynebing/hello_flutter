import 'package:flutter/material.dart';

/* 
  路由管理-基本路由
  ●场景:基本路由适合页面不多、跳转逻辑简单的场景
  ●用法:无需提前注册路由，跳转时创建 MaterialPageRoute实例即可

  跳转新页面:Navigator.push(Buildcontext context, Route route)
  返回上一页:Navigator.pop(BuildContext context)



  跳转新页面：Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPage()));
 */
void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListPage(),
    );
  }
}

//列表页
class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('列表页')),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //跳转到详情页
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPage()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                '我是第${index + 1}个',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },
        itemCount: 100,
      ),
    );
  }
}

//详情页
class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情页')),
      body: Center(
          child: TextButton(
              onPressed: () {
                //返回到列表页
                Navigator.pop(context);
              },
              child: Text('返回上一个页面'))),
    );
  }
}
