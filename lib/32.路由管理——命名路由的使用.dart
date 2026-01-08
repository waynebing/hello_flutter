import 'package:flutter/material.dart';

/* 
  
  路由管理-命名路由
  ●场景:应用页面增多后，使用命名路提升代码可维护性
  ●用法:需要先在 MaterialApp中注册一个路由表(routes)并设置initialRoute(首页)



  命名路由 Vs 简单路由:
  命名路由需在MaterialApp的routes中预先注册路由表，适合中大型项目管理；
  简单路由直接构建页面，更灵活，适合简单应用或快速原型开发。



  pushNamed   进入新页面   [A, B]→→ [A, B, C]   常规页面跳转，如列表页进入详情页

  pushReplacementNamed  替换当前页面  [A, B]→ [A, C]   登录成功后跳转主页，并无法返回登录页

  pushNamedAndRemoveUntil  跳转新页面并清理栈  [A, B, C, D]→ [A, E]  退出登录后跳转登录页，并清空所有历史页面

  popAndPushNamed   返回并立即跳转新页面    [A, B, C]→ [A, B, D]  购物车页面结算后，返回商品列表并同时跳转到订单页

  popUntil  连续返回直到条件满足  [A, B, C, D]→ [A, B]  从设置页的深层级，一键返回到主设置页面


 */
void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //注册路由表
    return MaterialApp(
      initialRoute: "/list",
      routes: {
        "/list": (context) => ListPage(),
        "/detail": (context) => DetailPage(),
      },
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
              Navigator.pushNamed(context, "/detail");
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
          child: Column(
        children: [
          TextButton(
              onPressed: () {
                //返回到列表页
                Navigator.pop(context);
              },
              child: Text('返回上一个页面')),
          TextButton(
              onPressed: () {
                //返回到列表页
                Navigator.pushNamed(context, "/list");
              },
              child: Text('去列表页')),
        ],
      )),
    );
  }
}
