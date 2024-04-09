
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class GestureDetectorTest extends StatefulWidget{
  const GestureDetectorTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _GestureDetectorState();
  }

}
class _GestureDetectorState extends State<GestureDetectorTest>{
  String _operation = "No Gesture detected!"; //保存事件名
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移
  double _width = 200.0; //通过修改图片宽度来达到缩放效果
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body:
      ///点击、双击、长按
/*      Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 200.0,
            child: Text(
              _operation,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateText("Tap"), //点击
          onDoubleTap: () => updateText("DoubleTap"), //双击
          onLongPress: () => updateText("LongPress"), //长按
        ),
      )*/
      ///拖动、滑动
       /*   Stack(
            children: <Widget>[
              Positioned(
                top: _top,
                left: _left,
                child: GestureDetector(
                  child: const CircleAvatar(child: Text("A")),
                  //手指按下时会触发此回调
                  onPanDown: (DragDownDetails e) {
                    //打印手指按下的位置(相对于屏幕)
                    //当用户按下时，此属性为用户按下的位置相对于屏幕（而非父组件）原点(左上角)的偏移。
                    print("用户手指按下：${e.globalPosition}");
                  },
                  //手指滑动时会触发此回调
                  onPanUpdate: (DragUpdateDetails e) {
                    //用户手指滑动时，更新偏移，重新构建
                    setState(() {
                      _left += e.delta.dx;
                      _top += e.delta.dy;
                    });
                  },
                  onPanEnd: (DragEndDetails e){
                    //打印滑动结束时在x、y轴上的速度
                    print(e.velocity);
                  },
                ),
              )
            ],
          )*/
      ///单一方向拖动
      /*  Stack(
            children: <Widget>[
              Positioned(
                top: _top,
                child: GestureDetector(
                  child: const CircleAvatar(child: Text("A")),
                  //垂直方向拖动事件
                  onVerticalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _top += details.delta.dy;
                    });
                  },
                ),
              )
            ],
        )*/
      ///缩放
      /* Center(
            child: GestureDetector(
              //指定宽度，高度自适应
              child: Image.asset("assets/images/login/guide_page_one.png", width: _width),
              onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  //缩放倍数在0.8到10倍之间
                  _width=200*details.scale.clamp(.5, 20.0);
                });
              },
            ),
        )*/
      ///GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势，GestureDetector直接可以接收一个子widget。
      ///GestureRecognizer是一个抽象类，一种手势的识别器对应一个GestureRecognizer的子类
      ///假设我们要给一段富文本（RichText）的不同部分分别添加点击事件处理器，但是TextSpan并不是一个widget，这时我们不能用GestureDetector，但TextSpan有一个recognizer属性，它可以接收一个GestureRecognizer
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: "你好世界"),
                  TextSpan(
                    text: "点我变色",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: _toggle ? Colors.blue : Colors.red,
                    ),
                    recognizer: _tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      },
                  ),
                  const TextSpan(text: "你好世界"),
                ],
              ),
            ),
          )
    );

  }


  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

}
