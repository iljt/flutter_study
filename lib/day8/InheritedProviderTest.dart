
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'InheritedProvider/ChangeNotifierProvider.dart';
import 'InheritedProvider/Consumer.dart';


class InheritedProviderTest extends StatefulWidget{
  const InheritedProviderTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _InheritedProviderState();
  }

}
class _InheritedProviderState extends State<InheritedProviderTest>{

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
      Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              children: <Widget>[
              /*  Builder(builder: (context){
                  var cart=ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价: ${cart?.totalPrice}");
                }),*/
                ///优化后
                ///需要显式调用ChangeNotifierProvider.of，当APP内部依赖CartModel很多时，这样的代码将很冗余
                ///语义不明确；由于ChangeNotifierProvider是订阅者，那么依赖CartModel的Widget自然就是订阅者，其实也就是状态的消费者，如果我们用Builder 来构建，语义就不是很明确；如果我们能使用一个具有明确语义的Widget，比如就叫Consumer，
                ///这样最终的代码语义将会很明确，只要看到Consumer，我们就知道它是依赖某个跨组件或全局的状态
                Consumer<CartModel>(
                   builder: (BuildContext context, cart) =>Text("总价: ${cart?.totalPrice}"),
                ),
                Builder(builder: (context){
                  print("ElevatedButton build"); //在后面优化部分会用到
                  return ElevatedButton(
                    child: Text("添加商品"),
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                   //   ChangeNotifierProvider.of<CartModel>(context)?.add(Item(20.0, 1));
                      /// listen 设为false，不建立依赖关系ElevatedButton build就不会一直打印
                      ///优化后
                      ChangeNotifierProvider.of<CartModel>(context, listen: false)?.add(Item(20.0, 1));

                    },
                  );
                }),
              ],
            );
          }),
       ) ,
     )
    );
  }

}

class Item {
  Item(this.price, this.count);
  double price; //商品单价
  int count; // 商品份数
}

class CartModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}