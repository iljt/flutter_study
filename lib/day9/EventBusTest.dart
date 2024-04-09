
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'eventbus/EventBus.dart';


class EventBusTest extends StatefulWidget{
  const EventBusTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _EventBusState();
  }

}
class _EventBusState extends State<EventBusTest>{

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
      body:TextButton(
        onPressed: () {
          bus.emit("loginSuccess","zhaozilong");
      }, child: const Text("发送一个EventBus事件"),)
     
    );

  }

}
