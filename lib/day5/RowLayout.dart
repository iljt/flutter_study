import 'package:flutter/material.dart';

class RowLayout extends StatelessWidget{
  const RowLayout({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body:  const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            //测试Row对齐方式，排除Column默认居中对齐的干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Row使用
              Row(
                //居中对齐
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              Row(
                //由于mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，所以对齐是无意义的，所以会从左往右显示
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              Row(
                //textDirection值为TextDirection.rtl，所以子组件会从右向左的顺序排列，而此时MainAxisAlignment.end表示左对齐
                //textDirection为TextDirection.rtl时 mainAxisAlignment: MainAxisAlignment.end为左对齐、
                // textDirection为TextDirection.ltr时 mainAxisAlignment: MainAxisAlignment.end为右对齐
                mainAxisAlignment: MainAxisAlignment.end,
                textDirection: TextDirection.rtl,
                //textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              Row(
                //纵轴的对齐方式，由于两个子 Text 字体不一样，所以其高度也不同，我们指定了verticalDirection值为VerticalDirection.up，即从低向顶排列，而此时crossAxisAlignment值为CrossAxisAlignment.start表示底对齐
                crossAxisAlignment: CrossAxisAlignment.end,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Text(" hello world ", style: TextStyle(fontSize: 30.0),),
                  Text(" I am Jack "),
                ],
              ),
            ],
          ),
          //Column的使用
        ],
      )

    );
  }


}