import 'package:flutter/material.dart';

///容器类Widget和布局类Widget都作用于其子Widget，不同的是：
/// 布局类Widget一般都需要接收一个widget数组（children），他们直接或间接继承自（或包含）MultiChildRenderObjectWidget ；而容器类Widget一般只需要接收一个子Widget（child），他们直接或间接继承自（或包含）SingleChildRenderObjectWidget。
/// 布局类Widget是按照一定的排列方式来对其子Widget进行排列；而容器类Widget一般只是包装其子Widget，对其添加一些修饰（补白或背景色等）、变换(旋转或剪裁等)、或限制(大小等)。
/// 注意，Flutter官方并没有对Widget进行官方分类，我们对其分类主要是为了方便讨论和对Widget功能区分的记忆

class ConWidget extends StatelessWidget{
  const ConWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("容器类组件"),
      ),
      body: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("pading_page",arguments: "Padding");
            }, child: const Text("填充Padding")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("decoratedbox_page",arguments: "DecoratedBox");
            }, child: const Text("装饰容器DecoratedBox")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("transform_page",arguments: "Transform");
            }, child: const Text("变换Transform")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("container_page",arguments: "Container");
            }, child: const Text("Container容器")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("clip_page",arguments: "Clip");
            }, child: const Text("剪裁Clip")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("fittedBox_page",arguments: "FittedBox");
            }, child: const Text("空间适配FittedBox")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("scaffold_page",arguments: "Scaffold");
            }, child: const Text("页面骨架Scaffold")),
          ],
      )
      )
    );
  }


}