import 'package:flutter/material.dart';

/* 1.无状态组件-build
2.有状态组件(创建阶段):createState ->initState ->didchangeDependencies -> build
3.有状态组件(更新阶段):didUpdatewidget ->build
4.有状态组件(销毁阶段):deactivate->dispose
5.执行一次函数:createState、initState、dispose
6.Inheritedwidget:专门用于在 Widget树中自顶向下高效地共享数据，顶层组件提供数据，子孙节点直接获取 */

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() {
    //widget初始化调用
    print("createState阶段执行");
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    //组件初始化调用  state对象插入widget树立刻执行，仅执行一次
    print("initState阶段执行");
    super.initState();
  }

  void didChangeDependencies() {
    //组件依赖关系发生变化时调用,initState后立刻执行，可能多次，此处生命周期结束就调用ui更新
    print("didChangeDependencies阶段执行");
    super.didChangeDependencies();
  }

  void didUpdateWidget(MainPage oldWidget) {
    //父组件传入新配置时调用，用于比较新旧配置
    print("didUpdateWidget阶段执行");
    super.didUpdateWidget(oldWidget);
  }

  void deactivate() {
    //当state对象从树中暂时移除时调用
    print("deactivate阶段执行");
    super.deactivate();
  }

  void dispose() {
    //当state对象被永久移除时调用，释放资源，仅执行一次
    print("dispose阶段执行");
    super.dispose();
  }

  Widget build(BuildContext context) {
    //构建UI方法，初始化或更新后多次调用
    print('build阶段执行');
    return Container(
      child: null,
    );
  }
}
