import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget{
  const ContainerWidget({super.key, required this.text});
  final String text;

  /**
   * Container是一个组合类容器，它本身不对应具体的RenderObject，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器，所以我们只需通过一个Container组件可以实现同时需要装饰、变换、限制的场景。下面是Container的定义：
   * Container({
      this.alignment,
      this.padding, //容器内补白，属于decoration的装饰范围
      Color color, // 背景色
      Decoration decoration, // 背景装饰
      Decoration foregroundDecoration, //前景装饰
      double width,//容器的宽度
      double height, //容器的高度
      BoxConstraints constraints, //容器大小的限制条件
      this.margin,//容器外补白，不属于decoration的装饰范围
      this.transform, //变换
      this.child,
      ...
      })
      Container的大多数属性在介绍其他容器时都已经使用过了，不再赘述，但有两点需要说明：
      容器的大小可以通过width、height属性来指定，也可以通过constraints来指定；如果它们同时存在时，width、height优先。实际上Container内部会根据width、height来生成一个constraints。
      color和decoration是互斥的，如果同时设置它们则会报错！实际上，当指定color时，Container内会自动创建一个decoration。

   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body:
    /*  Container(
        margin: const EdgeInsets.only(top: 50.0, left: 50.0),
        constraints: const BoxConstraints.tightFor(width: 200.0, height: 150.0),//卡片大小
        decoration: const BoxDecoration(  //背景装饰
          gradient: RadialGradient( //背景径向渐变
            colors: [Colors.red, Colors.orange],
            center: Alignment.topLeft,
            radius: .98,
          ),
          boxShadow: [
            //卡片阴影
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
            )
          ],
        ),
        transform: Matrix4.rotationZ(.2),//卡片倾斜变换
        alignment: Alignment.center, //卡片内文字居中
        child: const Text(
          //卡片文字
          "666", style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      )*/
    Column(children: [
      //Padding和Margin
      Container(
        margin: const EdgeInsets.all(20.0), //容器外补白
        color: Colors.orange,
        child: const Text("Hello world!"),
      ),
      Container(
        padding: const EdgeInsets.all(20.0), //容器内补白
        color: Colors.orange,
        child: const Text("Hello world!"),
      ),
    ],)

    );
  }


}