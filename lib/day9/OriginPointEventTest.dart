
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class OriginPointEventTest extends StatefulWidget{
  const OriginPointEventTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _OriginPointEventState();
  }

}
class _OriginPointEventState extends State<OriginPointEventTest>{
  PointerEvent? _event;

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
      body:
      ///Listener来监听原始触摸事件
    /*  Listener(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300.0,
          height: 150.0,
          child: Text('${_event?.localPosition ?? ''}',//localPosition指针相对于当对于本身布局坐标的偏移
            style: const TextStyle(color: Colors.white),),
        ),
        onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
        onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
        onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
      )*/
      ///可以使用IgnorePointer和AbsorbPointer，这两个组件都能阻止子树接收指针事件，
      ///不同之处在于AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与，这就意味着AbsorbPointer本身是可以接收指针事件的(但其子树不行)，而IgnorePointer不可以
      ///点击Container时，由于它在AbsorbPointer的子树上，所以不会响应指针事件，所以日志不会输出"in"，但AbsorbPointer本身是可以接收指针事件的，所以会输出"up"。如果将AbsorbPointer换成IgnorePointer，那么两个都不会输出
      Listener(
        child: AbsorbPointer(
          child: Listener(
            child: Container(
              color: Colors.red,
              width: 300.0,
              height: 300.0,
            ),
            onPointerDown: (event)=>print("Listener in"),
          ),
        ),
        onPointerDown: (event)=>print("AbsorbPointer up"),
      )
    );

  }

}
