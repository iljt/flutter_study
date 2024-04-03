
import 'package:flutter/material.dart';

import '../util/KeepAliveWrapper.dart';


class PageViewTest extends StatefulWidget{
  const PageViewTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _PageViewState();
  }

}
class _PageViewState extends State<PageViewTest> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
   var childPages= <Widget>[];
   for(int i =0;i<6;i++){
     childPages.add(KeepAliveWrapper(child: Page(text: "$i")));
   }
    return Scaffold(
       appBar: AppBar(
       title:  const Text("PageView"),
    ),
    body:
      PageView(
        scrollDirection: Axis.horizontal,// 滑动方向
      //  allowImplicitScrolling:true ,//只缓存前后各一页
        children:childPages,
    )

    );
  }

}

// Tab 页面
class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  _PageState2 createState() => _PageState2();
}

/*///缓存方式一
class _PageState1 extends State<Page> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    ///必须在 build 方法中调用一下 super.build(context)，该方法实现在 AutomaticKeepAliveClientMixin 中，功能就是根据当前 wantKeepAlive 的值给 AutomaticKeepAlive 发送消息，AutomaticKeepAlive 收到消息后就会开始工作
   ///需要注意，如果我们采用 PageView.custom 构建页面时没有给列表项包装 AutomaticKeepAlive 父组件，则上述方案不能正常工作，因为此时Client 发出消息后，找不到 Server，404 了
    super.build(context);
    print("build page ${widget.text}");
    return Center(child: Text(widget.text, textScaleFactor: 3));
  }

  @override
  bool get wantKeepAlive => true; // 是否需要缓存 相当于懒加载
}*/

///缓存方式二
class _PageState2 extends State<Page> {

  @override
  Widget build(BuildContext context) {
    print("build2 page ${widget.text}");
    return Center(child: Text(widget.text, textScaleFactor: 3));
  }

}