import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/* 
  一般情况下-在初始化状态initState获取页面数据
 */
void main(List<String> args) {}

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
      ..receiveTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10);

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
  get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}
