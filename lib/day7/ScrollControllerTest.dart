import 'package:flutter/material.dart';

/// Flutter Widget树中子Widget可以通过发送通知（Notification）与父(包括祖先)Widget通信。
/// 父级组件可以通过NotificationListener组件来监听自己关注的通知，这种通信方式类似于Web开发中浏览器的事件冒泡
/// 可滚动组件在滚动时会发送ScrollNotification类型的通知，ScrollBar正是通过监听滚动通知来实现的。通过NotificationListener监听滚动事件和通过ScrollController有两个主要的不同：
/// NotificationListener可以在可滚动组件到widget树根之间任意位置监听。而ScrollController只能和具体的可滚动组件关联后才可以。
/// 收到滚动事件后获得的信息不同；NotificationListener在收到滚动事件时，通知中会携带当前滚动位置和ViewPort的一些信息，而ScrollController只能获取当前滚动位置
class ScrollControllerTest extends StatefulWidget{
  const ScrollControllerTest({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerState();
  }

}
class _ScrollControllerState extends State<ScrollControllerTest> {
  final ScrollController _controller = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  String _progress = "0%"; //保存进度百分比

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("滚动监听及滚动通知")),
      body:
        ///滚动监听
/*      Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
            controller: _controller,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"),);
            }
        ),
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
          child: const Icon(Icons.arrow_upward),
          onPressed: () {
            //返回到顶部时执行动画
            _controller.animateTo(
              .0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          }
      ),
    );*/
    ///滚动通知
    Scrollbar(
    //进度条
    // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
      double progress = notification.metrics.pixels /
      notification.metrics.maxScrollExtent;
    //重新构建
      setState(() {
      _progress = "${(progress * 100).toInt()}%";
      });
      print("BottomEdge: ${notification.metrics.extentAfter == 0}");
      return false;
    //return true; //放开此行注释后，进度条将失效
    },
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
    ListView.builder(
      itemCount: 100,
      itemExtent: 50.0,
      itemBuilder: (context, index) => ListTile(title: Text("$index")),
    ),
    CircleAvatar(
    //显示进度百分比
      radius: 30.0,
      backgroundColor: Colors.black54,
      child: Text(_progress),
      )
     ],
     ),
     ),
    )
   );
  }
}

