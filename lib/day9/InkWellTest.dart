
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'eventbus/EventBus.dart';

///使用场景
/// 当需要给一个元素点击事件的时候，你可以用InkWell来包裹这个元素，它里面有常用交互事件和点击效果，可以简单实现想要的效果
///组件参数说明
/*const InkWell({
    Key key,
    Widget child, //子组件
    GestureTapCallback onTap, //单击事件
    GestureTapCallback onDoubleTap, //双击事件
    GestureLongPressCallback onLongPress, //长按事件
    GestureTapDownCallback onTapDown, //手指按下
    GestureTapCancelCallback onTapCancel, //取消点击事件
    ValueChanged<bool> onHighlightChanged, //突出显示或停止突出显示时调用
    ValueChanged<bool> onHover, //当指针进入或退出墨水响应区域时调用
    MouseCursor mouseCursor,
    Color focusColor, //获取焦点颜色
    Color hoverColor, //指针悬停时颜色
    Color highlightColor, //按住不放时的颜色
    MaterialStateProperty<Color> overlayColor,
    Color splashColor, //溅墨颜色
    InteractiveInkFeatureFactory splashFactory, //自定义溅墨效果
    double radius, //溅墨半径
    BorderRadius borderRadius, //溅墨元素边框圆角半径
    ShapeBorder customBorder, //覆盖borderRadius的自定义剪辑边框
    bool enableFeedback = true, //检测到的手势是否应该提供声音和/或触觉反馈，默认true
    bool excludeFromSemantics = false, //是否将此小部件引入的手势从语义树中排除。默认false
    FocusNode focusNode,
    bool canRequestFocus = true,
    ValueChanged<bool> onFocusChange,
    bool autofocus = false,
})*/

class InkWellTest extends StatefulWidget{
  const InkWellTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _InkWellState();
  }

}
class _InkWellState extends State<InkWellTest>{

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
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print('点击了');
                },
                child: const ListTile(
                  title: Text('InkWell的子组件是ListTile'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  print('点击了');
                },
                highlightColor: Colors.blue,
                autofocus: true,
                child: const Text('InkWell的子组件是Text'),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  print('必须要绑定事件，不然没效果');
                },
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                splashColor: Colors.red,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(300.0))),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('InkWell的子组件是Container'),
                  ),
                ),
              ),
            ],
          )),
    );

  }

}
