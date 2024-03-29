import 'package:flutter/material.dart';

class NamedRoute1 extends StatelessWidget{
  const NamedRoute1({super.key});

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args=ModalRoute.of(context)?.settings.arguments;
    print("args= $args");
    return Scaffold(
      appBar: AppBar(
        title: const Text("命名路由1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(args.toString()),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "命名路由1返回值999"),
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }

}