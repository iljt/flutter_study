import 'package:flutter/material.dart';

///布局组件
class Layout extends StatelessWidget{
  const Layout({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Layout$text"),
      ),
      body: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("row_page",arguments: "Row");
            }, child: const Text("线性布局Row")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("column_page",arguments: "Column");
            }, child: const Text("线性布局Column")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("row_and_column_page",arguments: "RowAndColumn");
            }, child: const Text("Row里面嵌套Row或者Column里嵌套Column")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("wrap_page",arguments: "Wrap");
            }, child: const Text("流式布局Wrap")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("stack_page",arguments: "StackAndPositioned");
            }, child: const Text("层叠布局Stack绝对定位Positioned")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("stack_page",arguments: "Flex");
            }, child: const Text(" 弹性布局Flex")),
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("algin_page",arguments: "Align");
            }, child: const Text(" 对齐与相对定位Align")),
          ],
      )
      )
    );
  }


}