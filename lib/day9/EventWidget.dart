import 'package:flutter/material.dart';

import 'eventbus/EventBus.dart';


class EventWidget extends StatefulWidget{
  const EventWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EventState();
  }
}

class _EventState extends State<EventWidget>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听登录事件
    bus.on("loginSuccess", (arg) {
      print("接收到EventBus消息1111111= $arg");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text("事件处理与通知"),
        ),
        body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("pointEvent_page",arguments: "原始指针事件处理");
                }, child: const Text("原始指针事件处理")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("gestureDetector_page",arguments: "手势识别");
                }, child: const Text("手势识别")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("eventMechanism_page",arguments: "Flutter事件机制");
                }, child: const Text("Flutter事件机制")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("gestureConflict_page",arguments: "手势原理与手势冲突");
                }, child: const Text("手势原理与手势冲突")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("eventBus_page",arguments: "事件总线");
                }, child: const Text("事件总线")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("notification_page",arguments: "Notification");
                }, child: const Text("通知Notification")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamed("inkWell_page",arguments: "InkWell");
                }, child: const Text("InkWell")),
              ],
            )
        )
    );
  }
}