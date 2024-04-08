
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class InheritedWidgetTest extends StatefulWidget{
  const InheritedWidgetTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _InheritedWidgetState();
  }

}
class _InheritedWidgetState extends State<InheritedWidgetTest>{
  int count = 0;

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
          //使用InheritedWidget中的共享数据
         //  Text(ShareDataWidget.of(context)!.data.toString())
      Center(
        child: ShareDataWidget( //使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),//子widget中依赖ShareDataWidget
              ),
              ElevatedButton(
                child: const Text("Increment"),
                //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      )
    );

  }

}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
   // return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    ///如果我们只想在__TestWidgetState中引用ShareDataWidget数据，但却不希望在ShareDataWidget发生变化时调用__TestWidgetState的didChangeDependencies()方法应该怎么办？改为下面的代码
    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>()!.widget as ShareDataWidget;

  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context)!.data.toString());
   // return Text("text"); //didChangeDependencies()方法不会调用
  }

  ///在“依赖”发生变化时被Flutter 框架调用。而这个“依赖”指的就是子 widget 是否使用了父 widget 中InheritedWidget的数据！如果使用了，则代表子 widget 有依赖；如果没有使用则代表没有依赖。
  ///这种机制可以使子组件在所依赖的InheritedWidget变化时来更新自身！比如当主题、locale(语言)等发生变化时，依赖其的子 widget 的didChangeDependencies方法将会被调用
  ///一般来说，子 widget 很少会重写此方法，因为在依赖改变后 Flutter 框架也都会调用build()方法重新构建组件树。但是，如果你需要在依赖改变后执行一些昂贵的操作，比如网络请求，这时最好的方式就是在此方法中执行，这样可以避免每次build()都执行这些昂贵操作
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("didChangeDependencies");
  }
}

