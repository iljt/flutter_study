import 'package:flutter/material.dart';


class FileAndNet extends StatefulWidget{
  const FileAndNet({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FileAndNetState();
  }
}

class _FileAndNetState extends State<FileAndNet>{

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text("文件操作和网络请求"),
        ),
        body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("fileOpera_page",arguments: "文件操作");
                }, child: const Text("文件操作")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("httpClient_page",arguments: "通过HttpClient发起HTTP请求");
                }, child: const Text("通过HttpClient发起HTTP请求")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("dio_page",arguments: "Http请求库-dio");
                }, child: const Text("Http请求库-dio")),
                TextButton(onPressed: () {
                 // Navigator.of(context).pushNamed("jsonToModel_page",arguments: "FlutterJsonBeanFactory插件生成dart实体类");
                }, child: const Text("JSON转Dart Model类(FlutterJsonBeanFactory插件生成dart实体类)")),

              ],
            )
        )
    );
  }
}