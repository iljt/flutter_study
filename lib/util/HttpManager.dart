import 'package:dio/dio.dart';
import 'package:flutter_study/util/Api.dart';

/// 网络请求封装
class HttpManager{
  late Dio _dio;
  static  final HttpManager _instance =HttpManager._internal();

  factory HttpManager.getInstance(){
    return HttpManager._instance;
  }

  //以 _ 开头的函数、变量无法在库外使用
   HttpManager._internal(){
    //基础配置
    BaseOptions options =BaseOptions(
        baseUrl: Api.baseUrl,//基础地址
        connectTimeout: const Duration(seconds: 5000),//连接服務器超时
        receiveTimeout: const Duration(seconds: 3000) //读取超时
    );
    _dio = Dio(options);
   }

   //默认方法参数get
   request(String url,{String method="get"}) async{
    try{
      Options options = Options(method:method);
      Response response = await _dio.request(url,options: options);
      ///一般来说，提供的是json字符串，response.data得到的就是这个json对应的map
      return response.data;
    }catch(e){
      return null;
    }
   }

}