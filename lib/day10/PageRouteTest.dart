
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RoutePage.dart';

class PageRouteTest extends StatefulWidget{
  const PageRouteTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _PageRouteState();
  }

}
class _PageRouteState extends State<PageRouteTest>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body:

      Column(
        children: [
          ///Material组件库中提供了一个MaterialPageRoute组件，它可以使用和平台风格一致的路由切换动画，如在iOS上会左右滑动切换，
          ///而在Android上会上下滑动切换。现在，我们如果在Android上也想使用左右切换风格使用CupertinoPageRoute
          ElevatedButton(onPressed: () {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context)=>RoutePage(),
            ));
          }, child: const Text("左右切换风格")),

          ///使用PageRouteBuilder自定义路由切换动画
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500), //动画时间为500毫秒
                pageBuilder: (BuildContext context, Animation<double> animation,Animation<double> secondaryAnimation) {
                  return FadeTransition(
                    //使用渐隐渐入过渡,
                    opacity: animation,
                    child: RoutePage(), //路由B
                  );
                },
              ),
            );
          }, child: const Text("自定义路由切换动画")),

          ///直接继承PageRoute类来实现自定义路由
          ElevatedButton(onPressed: () {
            Navigator.push(context, FadeRoute(builder: (context) {
              return RoutePage();
            }, barrierColor: Colors.white, barrierLabel: 'FadeRoute1111'));
          }, child: const Text("继承PageRoute类来实现自定义路由(渐隐渐入过渡效果)")),
      /*  虽然上面的两种方法都可以实现自定义切换动画，但实际使用时应优先考虑使用PageRouteBuilder，这样无需定义一个新的路由类，使用起来会比较方便。
        但是有些时候PageRouteBuilder是不能满足需求的，例如在应用过渡动画时我们需要读取当前路由的一些属性，这时就只能通过继承PageRoute的方式了，
        举个例子，假如我们只想在打开新路由时应用动画，而在返回时不使用动画，那么我们在构建过渡动画时就必须判断当前路由isActive属性是否为true*/
          ElevatedButton(onPressed: () {
            Navigator.push(context, FadeRoute2(builder: (context) {
              return RoutePage();
            }, barrierColor: Colors.white, barrierLabel: 'FadeRoute1111'));
          }, child: const Text("在打开新路由时应用动画，而在返回时不使用动画")),

       ]
      )

    );
  }

}

class FadeRoute extends PageRoute {
  FadeRoute({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    required this.barrierColor,
    required this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}


class FadeRoute2 extends PageRoute {
  FadeRoute2({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    required this.barrierColor,
    required this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);

  ///只想在打开新路由时应用动画，而在返回时不使用动画
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //当前路由被激活，是打开新路由
    if(isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    }else{
      //是返回，则不应用过渡动画
      return const Padding(padding: EdgeInsets.zero);
    }
  }

}