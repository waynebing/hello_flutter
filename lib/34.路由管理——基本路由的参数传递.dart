import 'package:flutter/material.dart';

/* 
  
  路由管理-传递参数-基础路由
  ●传递参数(基础路由):通过组件构造函数传递参数-(父传子)
  ●接收参数(基础路由):通过组件构造函数接收参数--(父传子)
  ●接收时机:initstate可获取到基础路由的构造函数传参




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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            id: index + 1,
                          )));
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
  final int? id;
  DetailPage({Key? key, this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _id = ""; //详情页的id

  @override
  void initState() {
    super.initState();
    print(widget.id);
  }

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
              child: Text('返回上一个页面${widget.id}')),
          TextButton(
              onPressed: () {
                //返回到列表页
                Navigator.pushNamed(context, "/list");
              },
              child: Text('去列表页$_id')),
        ],
      )),
    );
  }
}
