import 'package:flutter/material.dart';

class AliginLayout extends StatelessWidget{
  const AliginLayout({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      //我们显式指定了Container的宽、高都为 120。如果我们不显式指定宽高，而通过同时指定widthFactor和heightFactor 为 2 也是可以达到同样的效果
    /*  body:Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue.shade50,
        //alignment使用Alignment
        child: const Align(
           //alignment需要一个AlignmentGeometry类型的值，表示子组件在父组件中的起始位置。AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset
           //widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。
          // 如果值为null，则组件的宽高将会占用尽可能多的空间
        //  widthFactor: 2,
        //  heightFactor:2,
          //Alignment继承自AlignmentGeometry，表示矩形内的一个点，他有两个属性x、y，分别表示在水平和垂直方向的偏移,Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0)
         //FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致，所以理解起来会比较容易。
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      )*/

        //alignment使用FractionalOffset
    /* body: Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: const Align(
            // FractionalOffset的坐标转换公式为：实际偏移 = (FractionalOffse.x * (parentWidth - childWidth), FractionalOffse.y * (parentHeight - childHeight))
            //我们将FractionalOffset(0.2, 0.6)带入坐标转换公式得FlutterLogo实际偏移为（12，36），和实际运行效果吻合
            alignment: FractionalOffset(0.2, 0.6),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        )
*/
    //Center继承自Align，它比Align只少了一个alignment 参数；由于Align的构造函数中alignment 值为Alignment.center，所以，我们可以认为Center组件其实是对齐方式确定（Alignment.center）了的Align。
    //上面我们讲过当widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间，这一点需要特别注意，我们通过一个示例说明：
        body:
        const Column(children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("xxx"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 3,
              heightFactor: 1,
              child: Text("xxCCx"),
            ),
          )
        ],)
    );

  //  Align和Stack对比
   // 可以看到，Align和Stack/Positioned都可以用于指定子元素相对于父元素的偏移，但它们还是有两个主要区别：
  //  定位参考系统不同；Stack/Positioned定位的参考系可以是父容器矩形的四个顶点；而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，最终的偏移是需要通过alignment的转换公式来计算出。
  //  Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠
  }


}