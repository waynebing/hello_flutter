import 'package:flutter/material.dart';

/* 

  SingleChildscrollView组件

  让单个子组件可以用滚动，所有内容一次性渲染

  长表单、设置页、内容不固定但是总量不多的页面

  如果嵌套column或者row包含大量子项，会导致性能问题，建议使用ListView


  ListView

  线性列表，通过builder可以实现懒加载，性能优异(并不是一次构建所有列表项，而是按需构建)

  聊天记录、新闻、常见的单列滚动的数据列表

  采用按需渲染(懒加载)，只构建当前可见区域的列表项，极大提升长列表性能

  ListView-separated模式

  作用:在 ListView.builder的基础上，额外提供了构建分割线的能力



  GridView

  ●作用:用于创建二维可滚动网格布局的核心组件

  网格布局列表，支持懒加载，可以固定列数

  图片墙、商品网格、应用图标列表



  CustomScrollView
  
  复杂布局方案，通过组合多个Sliver组件实现滚动

   电商首页、社交App个人主页多个滚动紧密联动


  Pageview
  
  整页滚动效果，支持横向和纵向
  
  应用引导页、图片轮播图、书籍翻页


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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('登陆')),
            body: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // margin: EdgeInsets.only(top: 10),
                  color: Colors.blue,
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text('我是第${index + 1}个'),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.red,
                  height: 2,
                  width: double.infinity,
                );
              },
              itemCount: 100, //列表项的长度是多少
            )

            /* ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.blue,
                  height: 60,
                  width: double.infinity,
                  child: Text('我是第${index + 1}个'),
                  alignment: Alignment.center,
                );
              },
              itemCount: 100, //列表项的长度是多少
            ) */

            /* ListView(
            padding: EdgeInsets.only(top: 10),
            children: List.generate(100, (index) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.blue,
                height: 60,
                width: double.infinity,
                child: Text('我是第${index + 1}个'),
                alignment: Alignment.center,
              );
            }),
          )), */
            ));
  }
}
