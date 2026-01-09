import 'package:flutter/material.dart';

/* 
  
  路由管理-动态路由与高级控制
  ●场景:更复杂的场景，如需根据参数动态生成页面，或实现路由拦截，可以使用onGenerateRoute和onUnknownRoute
  ●onGenerateRoute:允许你根据 RouteSettings(包含路由名称和参数)动态创建不同的 Route
  ●onUnknownRoute:跳转一个未在路由表中注册、也未在 onGenerateRoute中处理的路由，会调用此回调。通常用于处理404错误页面。

 */

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/goodsList",
      routes: {
        "/goodsList": (context) => GoodsListPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/cartList') {
          bool isLogin = false;
          if (isLogin) {
            return MaterialPageRoute(builder: (context) => CartList());
          } else {
            return MaterialPageRoute(builder: (context) => LoginPage());
          }
        }
        return null;
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => NotFoundPage()),
    );
  }
}

//商品列表
class GoodsListPage extends StatefulWidget {
  GoodsListPage({Key? key}) : super(key: key);

  @override
  _GoodsListPageState createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('商品列表')),
        body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cartList");
              },
              child: Text('加入购物车')),
        ));
  }
}

//购物车列表
class CartList extends StatefulWidget {
  CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('购物车列表')),
        body: Center(
          child: TextButton(onPressed: () {}, child: Text('去支付')),
        ));
  }
}

//登陆页面
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('登陆页面')),
        body: Center(
          child: TextButton(onPressed: () {}, child: Text('去登陆')),
        ));
  }
}

//404页面
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('404页面')),
    );
  }
}
