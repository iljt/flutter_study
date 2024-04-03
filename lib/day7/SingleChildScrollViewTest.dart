import 'package:flutter/material.dart';

///通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，这是因为SingleChildScrollView不支持基于 Sliver 的延迟加载模型，
///所以如果预计视口可能包含超出屏幕尺寸太多的内容时，那么使用SingleChildScrollView将会非常昂贵（性能差）
class SingleChildScrollViewTest extends StatelessWidget{
  const SingleChildScrollViewTest({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ#";

    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body: Scrollbar( // 显示进度条
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.centerRight,
            child: Column(
              //动态创建一个List<Widget>
              children: str.split("")
              //每一个字母都用一个Text显示,字体为原来的两倍
                  .map((c) => Text(c, textScaleFactor: 2.0,))
                  .toList(),
            ),
          ),
        ),
      )

    );
  }


}