import 'package:flutter/material.dart';

class ColumnLayout extends StatelessWidget{
  const ColumnLayout({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      //Column使用
      body:  /*const Column(
        //由于我们没有指定Column的mainAxisSize，所以使用默认值MainAxisSize.max，则Column会在垂直方向占用尽可能多的空间，此例中会占满整个屏幕高度
        //由于我们指定了 crossAxisAlignment 属性为CrossAxisAlignment.center，那么子项在Column纵轴方向（此时为水平方向）会居中对齐。
        // 注意，在水平方向对齐是有边界的，总宽度为Column占用空间的实际宽度，而实际的宽度取决于子项中宽度最大的Widget。
        // 在本例中，Column有两个子Widget，而显示“world”的Text宽度最大，所以Column的实际宽度则为Text("world") 的宽度，所以居中对齐后Text("hi")会显示在Text("world")的中间部分
        //实际上，Row和Column都只会在主轴方向占用尽可能大的空间，而纵轴的长度则取决于他们最大子元素的长度。如果我们想让两个文本控件在整个手机屏幕中间对齐，我们有两种方法
        // 1、将Column的宽度指定为屏幕宽度；这很简单，我们可以通过ConstrainedBox或SizedBox（我们将在后面章节中专门介绍这两个Widget）来强制更改宽度限制
        //2、使用Center 组件
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("hi"),
          Text("world"),
        ],
      )*/
      //方式1 在整个手机屏幕中间对齐
  /*    ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("hi"),
            Text("world"),
          ],
        ),
      )*/

        //方式2 在整个手机屏幕中间对齐
        const Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,//水平居中
         // mainAxisAlignment: MainAxisAlignment.center,//垂直居中
          children: <Widget>[
            Text("hi"),
            Text("world"),
       ],
      ),
    )

    );
  }


}