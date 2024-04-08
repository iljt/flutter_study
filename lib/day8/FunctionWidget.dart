import 'package:flutter/material.dart';


class FunctionWidget extends StatelessWidget{
  const FunctionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("功能型组件"),
      ),
      body: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("willPopScope_page",arguments: "WillPopScope");
                }, child: const Text("导航返回拦截WillPopScope")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("inheritedWidget_page",arguments: "InheritedWidget");
                }, child: const Text("数据共享InheritedWidget")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("inheritedProvider_page",arguments: "InheritedProvider");
                }, child: const Text("跨组件状态共享InheritedProvider")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("colorAndTheme_page",arguments: "ColorAndTheme");
                }, child: const Text("颜色和主题")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("valueListenableBuilder_page",arguments: "ValueListenableBuilder");
                }, child: const Text("按需rebuild（ValueListenableBuilder）")),
               TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("futureBuilderAndStreamBuilder_page",arguments: "FutureBuilder、StreamBuilder");
               }, child: const Text("异步UI更新（FutureBuilder、StreamBuilder）")),
               TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("dialog_page",arguments: "Dialog");
               }, child: const Text("对话框Dialog")),
          ],
      )
      )
    );
  }

}