import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget{
  const PaddingWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body:
      //Padding可以给其子节点添加填充（留白），和边距效果类似
      const Padding(
        //上下左右各添加16像素补白
        padding: EdgeInsets.all(56),
        child: Column(
          //显式指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              //左边添加8像素补白
              padding: EdgeInsets.only(left: 8),
              child: Text("Hello world"),
            ),
            Padding(
              //上下各添加8像素补白
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text("I am Jack"),
            ),
            Padding(
              // 分别指定四个方向的补白
              padding: EdgeInsets.fromLTRB(20, 0, 20,0),
              child: Text("Your friend"),
            )
          ],
        ),
      )
    );
  }


}