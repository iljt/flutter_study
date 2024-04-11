
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnimalBaseTest extends StatefulWidget{
  const AnimalBaseTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _AnimalBaseState();
  }

}
class _AnimalBaseState extends State<AnimalBaseTest> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds:3),
      vsync: this,
    );

    //匀速
    //图片宽高从0变到300
    //addListener()函数调用了setState()，所以每次动画生成一个新的数字时，当前帧被标记为脏(dirty)，这会导致widget的build()方法再次被调用，
    // 而在build()中，改变Image的宽高，因为它的高度和宽度现在使用的是animation.value ，所以就会逐渐放大。
    //使用弹性曲线
    animation=CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 500.0).animate(animation)
      ..addListener(() {
        setState(() => {});
      });
    //动画状态监听
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源,以防止内存泄漏。
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return
      Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body:
       ///基础版本
     /* Center(
        child: Image.asset(
          "assets/images/login/guide_page_one.png",
          width: animation.value,
          height: animation.value,
         ),
        )*/
       ///用AnimatedBuilder重构
      ///child看起来像被指定了两次。但实际发生的事情是：将外部引用child传递给AnimatedBuilder后，AnimatedBuilder再将其传递给匿名构造器， 然后将该对象用作其子对象。最终的结果是AnimatedBuilder返回的对象插入到 widget 树中。
      ///也许你会说这和我们刚开始的示例差不了多少，其实它会带来三个好处：
      ///不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的。
      ///更好的性能：因为动画每一帧需要构建的 widget 的范围缩小了，如果没有builder，setState()将会在父组件上下文中调用，这将会导致父组件的build方法重新调用；而有了builder之后，只会导致动画widget自身的build重新调用，避免不必要的rebuild。
      ///通过AnimatedBuilder可以封装常见的过渡效果来复用动画。下面我们通过封装一个GrowTransition来说明，它可以对子widget实现放大动画
     /* AnimatedBuilder(
        animation: animation,
        child: Image.asset("assets/images/login/guide_page_one.png"),
        builder: (BuildContext ctx, child) {
          return  Center(
            child: SizedBox(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
          );
        },
      )*/

          GrowTransition(
             animation: animation,
             child: Image.asset("assets/images/login/guide_page_one.png"),
       )
    );

  }

}


class GrowTransition extends StatelessWidget {
  const GrowTransition({Key? key,
    required this.animation,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}