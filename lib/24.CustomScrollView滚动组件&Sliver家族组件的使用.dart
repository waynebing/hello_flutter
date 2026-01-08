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

  ●作用:用于组合多个可滚动组件(如列表、网格)，实现统一协调的滚动效果

  Siiver组件对应关系

  SliverList => ListView
  SliverGrid => Gridview
  SliverAppBar=> AppBar
  SliverPadding => Padding
  SliverToBoxAdapter =>ToBoxAdapter(用于包裹普通 Widget如Container一类)
  SliverPersistentHeader(粘性吸顶)



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
            body: CustomScrollView(
              //slivers只能放slivers家族的内容组件
              slivers: [
                //用来包裹普通Widget的组件
                SliverToBoxAdapter(
                  child: Container(
                      color: Colors.blue,
                      alignment: Alignment.center,
                      height: 260,
                      child:
                          Text('轮播图', style: TextStyle(color: Colors.white))),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _StickyCategoryDelegate(),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(100, (index) {
                    return Container(
                      color: Colors.blue,
                      alignment: Alignment.center,
                      height: 100,
                      child: Text(
                        '列表项${index + 1}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }),
                )
                /* SliverList.separated(
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.blue,
                        alignment: Alignment.center,
                        height: 100,
                        child: Text(
                          '列表项${index + 1}',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20);
                    }) */
              ],
            )));
  }
}

class _StickyCategoryDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: 30,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              '分类${index + 1}',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  @override
  //最大展开区高度
  // TODO: implement maxExtent
  double get maxExtent => 80;

  @override
  //最小折叠区高度
  // TODO: implement minExtent
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false; //不需要重建
  }
}
