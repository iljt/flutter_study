/*
import 'package:flutter/cupertino.dart';
///系统有个默认的
///ChangeNotifier类 ，它继承自Listenable，也实现了一个Flutter风格的发布者-订阅者模式
///我们将要共享的状态放到一个Model类中，然后让它继承自ChangeNotifier，这样当共享的状态改变时，我们只需要调用notifyListeners() 来通知订阅者，然后由订阅者来重新构建InheritedProvider
class ChangeNotifier implements Listenable {
  List listeners=[];

  @override
  void addListener(VoidCallback listener) {
    //添加监听器
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    //移除监听器
    listeners.remove(listener);
  }

  void notifyListeners() {
    //通知所有监听器，触发监听器回调
   // listeners.forEach((item)=>item());
    for (var item in listeners) {
      item();
    }
  }

}
*/
