import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

///Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作
///矩阵变化时发生在绘制时，而无需重新布局和构建等过程，所以性能很好
class TransformWidget extends StatelessWidget{
  const TransformWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body:
      //1、平移
    /*   Center(child:  DecoratedBox(
        decoration:const BoxDecoration(color: Colors.red),
        child: Transform.translate(
          //dx  -5往左移5
          //dy -10往上移10
          offset: const Offset(-5, -10),
          child: const Text("Hello World"),
        )
       ))*/

      //2、旋转 只对Text("Hello world")进行了旋转，DecoratedBox未进行了旋转，而RotatedBox对两个都进行旋转
      Center(child:  DecoratedBox(
          decoration:const BoxDecoration(color: Colors.red),
          child: Transform.rotate(
            //旋转90度
            angle:math.pi/2 ,
            child: const Text("Hello world"),
          )
      ))
    //3、缩放
    /*Center(child:  DecoratedBox(
          decoration:const BoxDecoration(color: Colors.red),
          child: Transform.scale(
              scale: 3, //放大到3倍
              child: const Text("Hello world")
          )
      ))*/
      //Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的
     // 由于第一个Text应用变换(放大)后，其在绘制时会放大，但其占用的空间依然为红色部分，所以第二个Text会紧挨着红色部分，最终就会出现文字重合。
     // 由于矩阵变化只会作用在绘制阶段，所以在某些场景下，在UI需要变化时，可以直接通过矩阵变化来达到视觉上的UI改变，而不需要去重新触发build流程，这样会节省layout的开销，所以性能会比较好。除此之外，Flutter的动画组件中也大量使用了Transform以提高性能。
    /*  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
              decoration:const BoxDecoration(color: Colors.red),
              child: Transform.scale(scale: 2,
                  child: const Text("Hello world")
              )
          ),
          const Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
        ],
      )*/

       ///RotatedBox
     /// RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小
     /// 由于RotatedBox是作用于layout阶段，所以子组件(DecoratedBox)会旋转90度（而不只是绘制的内容Text），decoration会作用到子组件所占用的实际空间上
    /*  const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            //将Transform.rotate换成RotatedBox
            child: RotatedBox(
              quarterTurns: 1, //旋转90度(1/4圈)
              child: Text("Hello world"),
            ),
          ),
          Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
        ],
      ),
*/
    );
  }


}