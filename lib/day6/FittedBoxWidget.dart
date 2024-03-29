import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget{
  const FittedBoxWidget({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body:
      //子组件大小超出了父组件大小时，如果不经过处理的话 Flutter 中就会显示一个溢出警告并在控制台打印错误日志，比如下面代码会导致溢出：
     /*  Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(children: [Text('xx'*30)]), //文本长度超出 Row 的最大宽度会溢出
      )*/
      ///那么子组件如何适配父组件空间。而根据 Flutter 布局协议适配算法应该在容器或布局组件的 layout 中实现，为了方便开发者自定义适配规则，Flutter 提供了一个 FittedBox 组件，定义如下：
      ///
      /// const FittedBox({
      ///   Key? key,
      ///   this.fit = BoxFit.contain, // 适配方式
      ///   this.alignment = Alignment.center, //对齐方式
      ///   this.clipBehavior = Clip.none, //是否剪裁
      ///   Widget? child,
      /// })
      /// #适配原理
      /// FittedBox 在布局子组件时会忽略其父组件传递的约束，可以允许子组件无限大，即FittedBox 传递给子组件的约束为（0<=width<=double.infinity, 0<= height <=double.infinity）。
      /// FittedBox 对子组件布局结束后就可以获得子组件真实的大小。
      /// FittedBox 知道子组件的真实大小也知道他父组件的约束，那么FittedBox 就可以通过指定的适配方式（BoxFit 枚举中指定），让起子组件在 FittedBox 父组件的约束范围内按照指定的方式显示。
      Center(
        child: Column(
        children: [
        ///因为父Container要比子Container 小，所以当没有指定任何适配方式时，子组件会按照其真实大小进行绘制，所以第一个蓝色区域会超出父组件的空间，因而看不到红色区域。
        wContainer(BoxFit.none),
        const Text('BoxFit.none'),
        ///第二个我们指定了适配方式为 BoxFit.contain，含义是按照子组件的比例缩放，尽可能多的占据父组件空间，因为子组件的长宽并不相同，所以按照比例缩放适配父组件后，父组件能显示一部分。
        wContainer(BoxFit.contain),
        const Text('BoxFit.contain'),
        wContainer(BoxFit.fill),
        const Text('BoxFit.fill'),
        wContainer(BoxFit.cover),
        const Text('BoxFit.cover'),
        wContainer(BoxFit.scaleDown),
        const Text('BoxFit.scaleDown'),
        wContainer(BoxFit.fitHeight),
        const Text('BoxFit.fitHeight'),
        wContainer(BoxFit.fitWidth),
        const Text('BoxFit.fitWidth'),
        ],
      )
     )
    );
  }

  Widget wContainer(BoxFit boxFit) {
    return ClipRect(//将超出子组件布局范围的绘制内容剪裁掉
        child: Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        // BoxFit 的各种适配规则和 Image 的 fix 属性指定是一样的
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    )
    );
   /* return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        // BoxFit 的各种适配规则和 Image 的 fix 属性指定是一样的
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    );*/
  }



}