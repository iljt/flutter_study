import 'package:flutter/cupertino.dart';

// 一个通用的InheritedWidget，保存需要跨组件共享的状态
///相当于更好使用的EventBus
class InheritedProvider<T> extends InheritedWidget {
   InheritedProvider({super.key,
    required this.data,
    required Widget child,
  }) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}