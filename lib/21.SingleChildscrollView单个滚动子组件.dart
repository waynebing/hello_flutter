import 'package:flutter/material.dart';

/* 

  SingleChildscrollView组件

  让单个子组件可以用滚动，所有内容一次性渲染

  长表单、设置页、内容不固定但是总量不多的页面

  如果嵌套column或者row包含大量子项，会导致性能问题，建议使用ListView


  ListView

  线性列表，通过builder可以实现懒加载，性能优异

  聊天记录、新闻、常见的单列滚动的数据列表

  GridView

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
  ScrollController _scrollController = ScrollController(); //滚动条控制器
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('登陆')),
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: List.generate(100, (index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.blue,
                      height: 100,
                      width: double.infinity,
                      child: Text('我是第${index + 1}个'),
                      alignment: Alignment.center,
                    );
                  }),
                  /* children: [
              Container(
                color: Colors.blue,
                height: 100,
                width: double.infinity,
                child: Text('我是第一个',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                alignment: Alignment.center,
              ),
            ], */
                ),
              ),
              Positioned(
                right: 0,
                top: 20,
                child: GestureDetector(
                  onTap: () {
                    print(
                        '去到最底部 - ${_scrollController.position.maxScrollExtent}');
                    /* 
                    // jumpTo 是瞬间移动到指定位置
                    _scrollController
                        .jumpTo(_scrollController.position.maxScrollExtent);  */
                    // animateTo 是动画移动到指定位置
                    _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '底部',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 20,
                child: GestureDetector(
                  onTap: () {
                    print(
                        '去到最顶部 - ${_scrollController.position.minScrollExtent}');
                    /* _scrollController
                        .jumpTo(_scrollController.position.minScrollExtent); */

                    // 动画跳转到最顶部
                    _scrollController.animateTo(0,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '顶部',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
