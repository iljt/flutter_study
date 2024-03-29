import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget{
  const NewRoute({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值666"),
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }


}