
import 'package:flutter/material.dart';

class FutureBuilderAndStreamBuilderTest extends StatefulWidget{
  const FutureBuilderAndStreamBuilderTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _FutureBuilderAndStreamBuilderTestState();
  }

}
class _FutureBuilderAndStreamBuilderTestState extends State<FutureBuilderAndStreamBuilderTest>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        appBar: AppBar(
          title: Text(widget.text),
        ),
        body:
        ///FutureBuilder
     /*   Center(
          //模拟网络请求
          child: FutureBuilder<String>(
            future: getNetworkData(),//异步耗时任务
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              /// 请求已结束
              ///snapshot会包含当前异步任务的状态信息及结果信息 ，可以通过snapshot.connectionState获取异步任务的状态信息、通过snapshot.hasError判断异步任务是否有错误等等
              ///每次组件重新build 都会重新发起请求，因为每次的 future 都是新的，实践中我们通常会有一些缓存策略，常见的处理方式是在 future 成功后将 future 缓存，这样下次build时，就不会再重新发起异步任务
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  /// 请求失败，显示错误
                  return Text("Error: ${snapshot.error}");
                } else {
                  /// 请求成功，显示数据
                  return Text("Contents: ${snapshot.data}");
                }
              } else {
                /// 请求未结束，显示loading
                return const CircularProgressIndicator(color: Colors.green,);
              }
            },
          ),
        )*/

      ///StreamBuilder
      ///在Dart中Stream 也是用于接收异步事件数据，和Future 不同的是，它可以接收多个异步操作的结果，它常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等。
      ///StreamBuilder正是用于配合Stream来展示流上事件（数据）变化的UI组件
        Center(child: StreamBuilder<int>(
          stream: counter(), //
          //initialData: ,// a Stream<int> or null
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('没有Stream');
              case ConnectionState.waiting:
                return const Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return const Text('Stream 已关闭');
            }
          },
        ))
    );
  }

  Stream<int> counter() {
    return Stream.periodic(const Duration(seconds: 1), (i) {
      return i;
    });
  }

  Future<String> getNetworkData() async {
    return Future.delayed(const Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

}
