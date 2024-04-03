import 'package:flutter/material.dart';


class ScrollViewWidget extends StatelessWidget{
  const ScrollViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("可滚动组件"),
      ),
      body: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("singlechildscroll_page",arguments: "SingleChildScrollView");
            }, child: const Text("SingleChildScrollView")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("listview_page",arguments: "ListView");
            }, child: const Text("ListView")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("scrollcontroller_page",arguments: " 滚动监听及控制");
            }, child: const Text(" 滚动监听及控制ScrollController")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("ainimallist_page",arguments: "AinimalList");
            }, child: const Text("AinimalList")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("girdview_page",arguments: "GirdView");
            }, child: const Text("GirdView")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("pageview_page",arguments: "PageView");
            }, child: const Text("PageView")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("tabbarview_page",arguments: "TabBarView");
            }, child: const Text("TabBarView")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("customScrollView_page",arguments: "CustomScrollView");
            }, child: const Text("CustomScrollView")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("nestedScrollView_page",arguments: "NestedScrollView");
            }, child: const Text("NestedScrollView")),
          ],
      )
      )
    );
  }


}