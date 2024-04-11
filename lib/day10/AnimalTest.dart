import 'package:flutter/material.dart';

/*
动画基本原理
在任何系统的UI框架中，动画实现的原理都是相同的，即：在一段时间内，快速地多次改变UI外观；由于人眼会产生视觉暂留，所以最终看到的就是一个“连续”的动画，这和电影的原理是一样的。我们将UI的一次改变称为一个动画帧，对应一次屏幕刷新，而决定动画流畅度的一个重要指标就是帧率FPS（Frame Per Second），即每秒的动画帧数。
很明显，帧率越高则动画就会越流畅！一般情况下，对于人眼来说，动画帧率超过16 FPS，就基本能看了，超过 32 FPS就会感觉相对平滑，而超过 32 FPS，大多数人基本上就感受不到差别了。由于动画的每一帧都是要改变UI输出，所以在一个时间段内连续的改变UI输出是比较耗资源的，
对设备的软硬件系统要求都较高，所以在UI系统中，动画的平均帧率是重要的性能指标，而在Flutter中，理想情况下是可以实现 60FPS 的，这和原生应用能达到的帧率是基本是持平的。
*/
class AnimalTest extends StatefulWidget{
  const AnimalTest({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimalState();
  }
}

class _AnimalState extends State<AnimalTest>{

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text("动画"),
        ),
        body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("baseAnimation_page",arguments: "动画基本结构及状态监听");
                }, child: const Text("动画基本结构及状态监听")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("diyRouteSwitching_page",arguments: "自定义路由切换动画");
                }, child: const Text("自定义路由切换动画")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("hero_page",arguments: "Hero动画");
                }, child: const Text("Hero动画")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("staggerAnimation_page",arguments: "交织动画");
                }, child: const Text("交织动画")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("animatedSwitcher_page",arguments: "动画切换组件实现出入动画");
                }, child: const Text("动画切换组件")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("nanimatedTransition_page",arguments: "动画过渡组件");
                }, child: const Text("动画过渡组件")),
              ],
            )
        )
    );
  }
}