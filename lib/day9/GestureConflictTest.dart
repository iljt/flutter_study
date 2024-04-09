
import 'package:flutter/material.dart';
import 'package:flutter_study/day9/util/CustomTapGestureRecognizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'eventbus/EventBus.dart';

class GestureConflictTest extends StatefulWidget{
  const GestureConflictTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _GestureConflictState();
  }

}
class _GestureConflictState extends State<GestureConflictTest>{
  double _top = 0.0;
  double _left = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return
       ///手势竞争
      ///同时识别水平和垂直方向的拖动手势，当用户按下手指时就会触发竞争（水平方向和垂直方向），一旦某个方向“获胜”，则直到当次拖动手势结束都会沿着该方向移动
      ///每次拖动只会沿一个方向移动（水平或垂直），而竞争发生在手指按下后首次移动（move）时，此例中具体的“获胜”条件是：首次移动时的位移在水平和垂直方向上的分量大的一个获胜
      Scaffold(
        appBar: AppBar(
          title: Text(widget.text),
        ),
        body:
    /* Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: const CircleAvatar(child: Text("A")),
                //垂直方向拖动事件
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  print("onVerticalDragUpdate");
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  print("onHorizontalDragUpdate");
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
              ),
            )
          ],
        )

    );*/
     ///多手势冲突
     ///发现没有打印"up"，这是因为在拖动时，刚开始按下手指且没有移动时，拖动手势还没有完整的语义，此时TapDown手势胜出(win)，此时打印"down"，而拖动时，拖动手势会胜出，
      ///当手指抬起时，onHorizontalDragEnd 和 onTapUp发生了冲突，但是因为是在拖动的语义中，所以onHorizontalDragEnd胜出，所以就会打印 “onHorizontalDragEnd”。
     ///如果我们的代码逻辑中，对于手指按下和抬起是强依赖的，比如在一个轮播图组件中，我们希望手指按下时，暂停轮播，而抬起时恢复轮播，但是由于轮播图组件中本身可能已经处理了拖动手势（支持手动滑动切换），
      ///甚至可能也支持了缩放手势，这时我们如果在外部再用onTapDown、onTapUp来监听的话是不行的。这时我们应该怎么做？其实很简单，通过Listener监听原始指针事件就行
    /*  Stack(
        children: <Widget>[
          Positioned(
            left: _left,
            //通过Listener监听原始指针事件解决多手势冲突
            child: Listener(
            onPointerDown: (details) {
              print("down");
           },
           onPointerUp: (details) {
          //会触发
            print("up");
           },
           child:GestureDetector(
              child: const CircleAvatar(child: Text("A")), //要拖动和点击的widget
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details){
                print("onHorizontalDragEnd");
              },
              *//*onTapDown: (details){
                print("down");
              },
              onTapUp: (details){
                print("up");
              },*//*
            ),
          )
         )
        ],
       )*/
     /* 手势是对原始指针的语义化的识别，手势冲突只是手势级别的，也就是说只会在组件树中的多个 GestureDetector 之间才有冲突的场景，如果压根就没有使用 GestureDetector 则不存在所谓的冲突，因为每一个节点都能收到事件，只是在 GestureDetector 中为了识别语义，它会去决定哪些子节点应该忽略事件，哪些节点应该生效。
        解决手势冲突的方法有两种：
        使用 Listener。这相当于跳出了手势识别那套规则。
        自定义手势手势识别器（ Recognizer）。 */
        ///通过 Listener 解决手势冲突的原因是竞争只是针对手势的，而 Listener 是监听原始指针事件，原始指针事件并非语义话的手势，所以根本不会走手势竞争的逻辑，所以也就不会相互影响。
        ///方式1:通过Listener的解决方式为：
        ///如果最外面使用GestureDetector当我们点击子组件（灰色区域）时，控制台只会打印 “1”, 并不会打印 “2”，这是因为手指抬起后，GestureDetector1 和 GestureDetector 2 会发生竞争，判定获胜的规则是“子组件优先”，所以 GestureDetector1 获胜，因为只能有一个“竞争者”胜出，所以 GestureDetector 2 将被忽略
    /*    Listener(  // 将 GestureDetector 换为Listener 即可先打印2,再打印 1
       *//*  GestureDetector(
          onTap: () => print("2"),*//*
          onPointerUp: (x) => print("2"),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => print("1"),
              child: Container(
                width: 80,
                height: 80,
                color: Colors.grey,
              ),
            ),
          ),
        )*/
       ///方式2:通过自定义 Recognizer 解决手势冲突
       ///这个例子说明了一次手势处理过程也是可以有多个胜出者的
        customGestureDetector(  // 将 GestureDetector 换为customGestureDetector 即可先打印111,再打印222，与Listener相反
          onTap: () => print("222"),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => print("111"),
              child: Container(
                width: 80,
                height: 80,
                color: Colors.grey,
              ),
            ),
          ),
        )
      );

  }

}
