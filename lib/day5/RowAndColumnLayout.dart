import 'package:flutter/material.dart';

class RowAndColumnLayout extends StatelessWidget{
  const RowAndColumnLayout({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      //Column使用
      body:  Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          //如果Row里面嵌套Row，或者Column里面再嵌套Column，那么只有最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
          /*Container(
                color: Colors.red,
                child: const Column(
                  mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                 )
                ),*/

                //如果要让里面的Column占满外部Column，可以使用Expanded 组件
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                      children: <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      )

    );
  }


}