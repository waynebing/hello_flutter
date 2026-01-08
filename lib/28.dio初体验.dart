import 'package:dio/dio.dart';

/* 
  一般情况下-在初始化状态initState获取页面数据
 */
void main(List<String> args) {
  Dio().get("https://geek.itheima.net/v1_0/channel").then((res) {
    print(res);
  }).catchError((err) {
    print(err);
  });
}
