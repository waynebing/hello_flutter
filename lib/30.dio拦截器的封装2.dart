import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/* 
  一般情况下-在初始化状态initState获取页面数据


  flutter解决跨域的方法：

  默认情况下,flutter运行 web 端加载网络资源会报跨域提示错误。
  1.在flutter/packages/flutter tools/lib/src/web/chrome.dart如下图位置添加'--disable-web-security'

  2.删除flutter/bin/cache/下flutter tools.snaphot和flutter tools.stamp

  3.执行flutter doctor -v  然后重新运行项目



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
  void initState() {
    super.initState();
    _getChannels();
  }

  List<Map<String, dynamic>> _list = []; // 用来接收数掘的
  void _getChannels() async {
    DioUtils util = DioUtils(); //创建实例化对象
    Response<dynamic> result = await util.get('channels');
    Map<String, dynamic> res = result.data as Map<String, dynamic>;
    List data = res["data"]["channels"] as List;
    _list = data.cast<Map<String, dynamic>>(); //cast方法强制转化列表项的类型
    setState(() {});
    print(_list);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Dio实例')),
            body: GridView.extent(
              maxCrossAxisExtent: 140,
              padding: EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3,
              children: List.generate(_list.length, (index) {
                return ChannelItem();
              }),
            )));
  }
}

//用来绘制每个频道的UI内容
class ChannelItem extends StatelessWidget {
  const ChannelItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        '测试',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}

class DioUtils {
  final Dio _dio = Dio();
  DioUtils() {
    /* _dio.options.baseUrl = "https://geek.itheima.net/v1_0";
    _dio.options.connectTimeout = Duration(seconds: 10); //连接超时时间
    _dio.options.receiveTimeout = Duration(seconds: 10); //接收超时时间
    _dio.options.sendTimeout = Duration(seconds: 10); //发送超时时间 */

    _dio.options
      ..baseUrl = "https://geek.itheima.net/v1_0"
      ..connectTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10);
    // ..sendTimeout = Duration(seconds: 10);
    //拦截器
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (context, handler) {
        handler.next(context);
      },
      onResponse: (context, handler) {
        //3,4,5  3一般是缓存，4一般是请求参数有问题
        if (context.statusCode! >= 200 && context.statusCode! < 300) {
          handler.next(context);
          return;
        }
        //说明异常
        handler.reject(DioException(requestOptions: context.requestOptions));
        //抛出异常
      },
      onError: (context, handler) {
        handler.reject(context);
      },
    ));
  }

  //向外暴露一个get方法
  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}
