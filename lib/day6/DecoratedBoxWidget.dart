import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///DecoratedBox可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等。DecoratedBox
class DecoratedBoxWidget extends StatelessWidget{
  const DecoratedBoxWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body:
      //构造函数参数
      // decoration：代表将要绘制的装饰，它的类型为Decoration。Decoration是一个抽象类，它定义了一个接口 createBoxPainter()，子类的主要职责是需要通过实现它来创建一个画笔，该画笔用于绘制装饰。
      // position：此属性决定在哪里绘制Decoration，它接收DecorationPosition的枚举类型，该枚举类有两个值：
      // background：在子组件之后绘制，即背景装饰。
      // foreground：在子组件之上绘制，即前景
      //我们通常会直接使用BoxDecoration类，它是一个Decoration的子类，实现了常用的装饰元素的绘制。
      Center(child: DecoratedBox(
        /* BoxDecoration({
             Color color, //颜色
             DecorationImage image,//图片
             BoxBorder border, //边框
             BorderRadiusGeometry borderRadius, //圆角
             List<BoxShadow> boxShadow, //阴影,可以指定多个
             Gradient gradient, //渐变
             BlendMode backgroundBlendMode, //背景混合模式
             BoxShape shape = BoxShape.rectangle, //形状
           })*/
          decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.red,Colors.orange.shade700]), //背景渐变
              borderRadius: BorderRadius.circular(5.0), //5像素圆角
              boxShadow: const [ //阴影
                BoxShadow(
                    color:Colors.black54,
                    offset: Offset(2.0,2.0),
                    blurRadius: 4.0
                )
              ]
          ),
          child:const Padding(
            //左边添加8像素补白
            padding: EdgeInsets.symmetric(horizontal:50.0, vertical: 15.0),
            child: Text("提交",style: TextStyle(color:Colors.white),),
          )
      ))

    );
  }


}