import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';


class DioTest extends StatefulWidget{
  const DioTest({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DioState();
  }
}

class _DioState extends State<DioTest>{
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text("Dio求网络请"),
        ),
        body:
        Container(
          alignment: Alignment.center,
          child: FutureBuilder(
              future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //请求完成
                if (snapshot.connectionState == ConnectionState.done) {
                  Response response = snapshot.data;
                  //发生错误
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  //请求成功，通过项目信息构建用于显示项目名称的ListView
                  return ListView(
                    children: response.data.map<Widget>((e) =>
                        ListTile(title: Text(e["full_name"]))
                    ).toList(),
                  );
                }
                //请求未完成时弹出loading
                return const CircularProgressIndicator();
              }
          ),
        )
    );
  }

  dioRequest() async {
    Dio dio =  Dio();
    Response response;
    response=await dio.get("https://api.github.com/orgs/flutterchina/repos");
    print(response.data.toString());
    ///get带参数"/test?id=12&name=xxx或者queryParameters:{"id":12,"name":"xxx"}
   /*    response=await dio.get("/test",queryParameters:{"id":12,"name":"xxx"})
    print(response);*/
    ///post请求
   // response=await dio.post("/test",data:{"id":12,"name":"xxx"});
    ///多个并发请求
   // response= (await Future.wait([dio.post("/info"),dio.get("/token")])) as Response;
    ///下载文件 _savePath文件路径
   // response=await dio.download("https://www.google.com/",_savePath);
    ///发送 FormData 如果发送的数据是FormData，则dio会将请求header的contentType设为“multipart/form-data”
   /* FormData formData = FormData.fromMap({
        "name": "wendux",
      "age": 25,
     });
     response = await dio.post("/info", data: formData);*/
    ///通过FormData上传多个文件
   /* FormData formData = FormData.fromMap({
      "name": "xxx",
      "age": 22,
      "file1": UploadFileInfo(File("./upload.txt"), "upload1.txt"),
      "file2": UploadFileInfo(File("./upload.txt"), "upload2.txt"),
      // 支持文件数组上传
      "files": [
        UploadFileInfo(File("./example/upload.txt"), "upload.txt"),
        UploadFileInfo(File("./example/upload.txt"), "upload.txt")
      ]
    });
    response = await dio.post("/info", data: formData);*/
   ///dio内部仍然使用HttpClient发起的请求，所以代理、请求认证、证书校验等和HttpClient是相同的，我们可以在onHttpClientCreate回调中设置
    ///onHttpClientCreate会在当前dio实例内部需要创建HttpClient时调用，所以通过此回调配置HttpClient会对整个dio实例生效，
    ///如果应用需要多种代理或证书校验策略，可以创建不同的dio实例来分别实现
   /* String PEM="XXXXX";//可以从文件读取
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = (client) {
      //设置代理
      client.findProxy = (uri) {
        return "PROXY 192.168.1.2:8888";
      };
      //校验证书
      client.badCertificateCallback=(X509Certificate cert, String host, int port){
        if(cert.pem==PEM){
          return true; //证书一致，则允许发送数据
        }
        return false;
      };
    } as CreateHttpClient?;*/
  }


}