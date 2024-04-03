
import 'package:flutter/material.dart';

import '../util/KeepAliveWrapper.dart';


class TabBarViewTest extends StatefulWidget{
  const TabBarViewTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _TabBarViewState();
  }

}
class _TabBarViewState extends State<TabBarViewTest>  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return
    /*  ///方式一
      Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.red,
          tabs: tabs.map((e) => Tab(child: Text(e,style: const TextStyle(color: Colors.green,fontSize: 18)),))//Tab 的text 和 child 是互斥的，不能同时制定
              .toList(),
        ),
      ),
      body: TabBarView( //构建
        controller: _tabController,
        children: tabs.map((e) {
          return KeepAliveWrapper(
            child: Container(
              alignment: Alignment.center,
              child: Text(e, textScaleFactor: 3),
            ),
          );
        }).toList(),
      ),
    );*/
     ///方式二
     ///我们发现创建 TabController 的过程还是比较复杂，实战中，如果需要 TabBar 和 TabBarView 联动，通常会创建一个 DefaultTabController 作为它们共同的父级组件，这样它们在执行时就会从组件树向上查找，都会使用我们指定的这个 DefaultTabController
     ///我们无需去手动管理 Controller 的生命周期，也不需要提供 SingleTickerProviderStateMixin，同时也没有其他的状态需要管理，也就不需要用 StatefulWidget 了，这样简单很多
    DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("DefaultTabController创建TabBarView"),
          bottom: TabBar(
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView( //构建
          children: tabs.map((e) {
            //缓存页面
            return KeepAliveWrapper(
              child: Container(
                alignment: Alignment.center,
                child: Text(e, textScaleFactor: 5),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }


  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }

}
