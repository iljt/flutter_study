
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationTest extends StatefulWidget{
  const NotificationTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _NotificationState();
  }

}

class _NotificationState extends State<NotificationTest>{
  String _msg = "";

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
      ///监听通知
    /*  NotificationListener(
        onNotification: (notification){
          switch (notification.runtimeType){
            case ScrollStartNotification: print("开始滚动"); break;
            case ScrollUpdateNotification: print("正在滚动"); break;
            case ScrollEndNotification: print("滚动停止"); break;
            case OverscrollNotification: print("滚动到边界"); break;
          }
          return false;
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"),);
            }
        ),
      )*/
      //指定监听通知的类型为滚动结束通知(ScrollEndNotification)
     /* NotificationListener<ScrollEndNotification>(
        onNotification: (notification){
          //只会在滚动结束时才会触发此回调
          print("ScrollEndNotification======= $notification");
          ///nNotification回调为通知处理回调，其函数签名如下：
          /// typedef NotificationListenerCallback<T extends Notification> = bool Function(T notification);
          /// 它的返回值类型为布尔值，当返回值为true时，阻止冒泡，其父级Widget将再也收不到该通知；当返回值为false 时继续向上冒泡通知。
          return false;
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"),);
            }
        ),
      )*/
      //自定义通知
    /*   NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg+="${notification.msg}  ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            ///下面注释的部分是不能正常工作的，因为这个context是根Context，而NotificationListener是监听的子树，所以我们通过Builder来构建ElevatedButton，来获得按钮位置的context
//           ElevatedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    //按钮点击时分发通知
                    onPressed: () => MyNotification("ttt").dispatch(context),
                    child: const Text("Send Notification"),
                  );
                },
              ),
              Text(_msg)
            ],
          ),
        ),
      )*/
      ///阻止通知冒泡
      ///两个NotificationListener进行了嵌套，子NotificationListener的onNotification回调返回了false，表示不阻止冒泡，所以父NotificationListener仍然会受到通知，所以控制台会打印出通知信息；
      ///如果将子NotificationListener的onNotification回调的返回值改为true，则父NotificationListener便不会再打印通知了，因为子NotificationListener已经终止通知冒泡了。
      NotificationListener<MyNotification>(
        onNotification: (notification){
          print(notification.msg); //打印通知
          return false;
        },
        child: NotificationListener<MyNotification>(
            onNotification: (notification) {
              setState(() {
                _msg+=notification.msg+"  ";
              });
              //返回true则父NotificationListener便不会再打印通知了,但是没效果why？？？？
              return true;
            },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return ElevatedButton(
                      //按钮点击时分发通知
                      onPressed: () => MyNotification("Hi").dispatch(context),
                      child: Text("Send Notification"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
        ),
      )
    );
  }

}

///Notification有一个dispatch(context)方法，它是用于分发通知的，我们说过context实际上就是操作Element的一个接口，
///它与Element树上的节点是对应的，通知会从context对应的Element节点向上冒泡
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
