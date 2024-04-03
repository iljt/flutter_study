import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class ListViewTest extends StatefulWidget{
  const ListViewTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _ListViewState();
  }

}
class _ListViewState extends State<ListViewTest> {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ#";
  Widget divider1=const Divider(color: Colors.blue,);
  Widget divider2=const Divider(color: Colors.green);
  static const loadingTag = "##loading##"; //表尾标记
  final _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {


    @override
    void initState() {
      super.initState();
      _retrieveData();
    }


    return Scaffold(
        appBar: AppBar(
          title:  const Text("ListView"),
        ),
        body:
        /*  ///默认构造函数有一个children参数，它接受一个Widget列表（List<Widget>）。这种方式适合只有少量的子组件数量已知且比较少的情况，反之则应该使用ListView.builder 按需动态构建列表项。
      ///注意：虽然这种方式将所有children一次性传递给 ListView，但子组件）仍然是在需要时才会加载（build（如有）、布局、绘制），也就是说通过默认构造函数构建的 ListView 也是基于 Sliver 的列表懒加载模型。
      ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: const <Widget>[
          Text('I\'m f'),
          Text('12312323'),
          Text('是打发打发'),
        ],
      )*/

        /*///ListView.builder适合列表项比较多或者列表项不确定的情况
      ListView.builder(
          itemCount: 100,
          itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("$index"));
          }
      )*/

        /*    ///ListView.separated可以在生成的列表项之间添加一个分割组件
     ListView.separated(
      itemCount: 200,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      },
     )*/

        ///固定高度列表
        /*  ///给列表指定 itemExtent 或 prototypeItem 会有更高的性能，所以当我们知道列表项的高度都相同时，强烈建议指定 itemExtent 或 prototypeItem
         ListView.builder(
           // itemCount: 50,//未指定时为无限多
            prototypeItem: const ListTile(title: Text("1")),
            //itemExtent: 56,
           itemBuilder: (BuildContext context, int index) {
            //LayoutLogPrint是一个自定义组件，在布局时可以打印当前上下文中父组件给子组件的约束信息
                return ListTile(title: Text("$index"));
             },
        )*/

        ///添加固定列表头
        ///可以使用Expanded自动拉伸组件大小，并且我们也说过Column是继承自Flex的，所以我们可以直接使用Column + Expanded来实现
      /*  Column(children: <Widget>[
          const ListTile(title:Text("HeadTitle")),
          Expanded(
            child: ListView.builder(itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            }),
          ),
        ])*/
    ///无限加载列表 下拉加载更多
    ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
        //不足100条，继续获取数据
        if (_words.length - 1 < 100) {
        //获取数据
          _retrieveData();
        //加载时显示loading
        return Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const SizedBox(
            width: 24.0,
            height: 24.0,
            child: CircularProgressIndicator(strokeWidth: 2.0),
            ),
            );
        } else {
        //已经加载了100条数据，不再获取数据。
          return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
              "没有更多了",
              style: TextStyle(color: Colors.grey),
              ),
          );
         }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => const Divider(height: .0),
     )
    );
  }


  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }

}

