
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ValueListenableBuilderTest extends StatefulWidget{
  const ValueListenableBuilderTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _ValueListenableBuilderTestState();
  }

}
class _ValueListenableBuilderTestState extends State<ValueListenableBuilderTest>{
  // 定义一个ValueNotifier，当数字变化时会通知 ValueListenableBuilder
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 添加 + 按钮不会触发整个 ValueListenableRoute 组件的 build
    print('build');
    return
      Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body:
      ///valueListenable：类型为 ValueListenable<T>，表示一个可监听的数据源。
      ///builder：数据源发生变化通知时，会重新调用 builder 重新 build 子组件树。
      ///child: builder 中每次都会重新构建整个子组件树，如果子组件树中有一些不变的部分，可以传递给child，child 会作为builder的第三个参数传递给 builder，通过这种方式就可以实现组件缓存，原理和AnimatedBuilder 第三个 child 相同。
      ///控制台只在页面打开时 build 了一次，点击 + 按钮的时候只是ValueListenableBuilder 重新构建了子组件树，而整个页面并没有重新 build ，因此日志面板只打印了一次 "build"
      Center(
        child: ValueListenableBuilder<int>(
          builder: (BuildContext context, int value, Widget? child) {
            // builder 方法只会在 _counter 变化时被调用
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child!,
                Text('$value 次',textScaleFactor: textScaleFactor),
              ],
            );
          },
          valueListenable: _counter,
          // 当子组件不依赖变化的数据，且子组件收件开销比较大时，指定 child 属性来缓存子组件非常有用
          child: const Text('点击了 ', textScaleFactor: textScaleFactor),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          // 点击后值 +1，触发 ValueListenableBuilder 重新构建
          onPressed: () => _counter.value += 1,
        ),
    );

  }

}
