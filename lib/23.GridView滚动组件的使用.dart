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


  GridView.extent构造

  ●作用:使用GridView.extent指定子项最大宽度或者高度

  通过maxCrossAxisExtent或者纵向有多少列来确定每行展示数量

  GridView-GridView.builder构造

  ●作用:使用GridView.builder实现动态长网格-(懒加载，只渲染可见区域)注意:接收gridDelegate布局委托、itemBuilder构建函数、itemcount构建数量





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
            appBar: AppBar(title: Text('GridView')),
            //可见区域的懒加载，没见到的部分就已经销毁了
            body: GridView.builder(
              //按照宽度去固定
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, //最大宽度
                mainAxisSpacing: 10, //主轴间距
                crossAxisSpacing: 10, //纵轴间距
                childAspectRatio: 2.0, //子组件宽高比
              ),

              //按照列数去固定
              /* gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, //纵向有多少列
                mainAxisSpacing: 10, //主轴间距
                crossAxisSpacing: 10, //纵轴间距
                childAspectRatio: 1.0, //子组件宽高比
              ), */ //布局委托
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    '我是第${index + 1}个',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
              itemCount: 100,
            )

            /* GridView.extent(
              maxCrossAxisExtent: 100, //count不论屏幕变化都不会改变每行展示数量  根据最大高度和宽度来确定
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(100, (index) {
                return Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    '我是第${index + 1}个',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            ) */

            /* GridView.count(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(100, (index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  height: 60,
                  width: double.infinity,
                  child: Text(
                    '我是第${index + 1}个',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            ) */

            ));
  }
}
