
import 'package:flutter/material.dart';

import 'StaggerAnimation.dart';
/*
有些时候我们可能会需要一些复杂的动画，这些动画可能由一个动画序列或重叠的动画组成，比如：有一个柱状图，需要在高度增长的同时改变颜色，等到增长到最大高度后，我们需要在X轴上平移一段距离。可以发现上述场景在不同阶段包含了多种动画，要实现这种效果，使用交织动画（Stagger Animation）会非常简单。交织动画需要注意以下几点：
要创建交织动画，需要使用多个动画对象（Animation）。
一个AnimationController控制所有的动画对象。
给每一个动画对象指定时间间隔（Interval）
所有动画都由同一个AnimationController (opens new window)驱动，无论动画需要持续多长时间，控制器的值必须在0.0到1.0之间，而每个动画的间隔（Interval）也必须介于0.0和1.0之间。对于在间隔中设置动画的每个属性，需要分别创建一个Tween (opens new window)用于指定该属性的开始值和结束值。也就是说0.0到1.0代表整个动画过程，我们可以给不同动画指定不同的起始点和终止点来决定它们的开始时间和终止时间。
*/

class StaggerAnimationTest extends StatefulWidget{
  const StaggerAnimationTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _StaggerAnimationState();
  }

}
class _StaggerAnimationState extends State<StaggerAnimationTest> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      //捕获异常。可能发生在组件销毁时，计时器会被取消。
    }
  }


  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body:
    Center(
        child: Column(
        children: [
          ElevatedButton(
              onPressed: () => _playAnimation(),
              child: Text("start animation"),
          ),
          Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
              color: Colors.black.withOpacity(0.5),
           ),
          ),
          //调用我们定义的交错动画Widget
             child: StaggerAnimation(controller: _controller),
            ),
       ],
       ),
     )
    );

  }

}
