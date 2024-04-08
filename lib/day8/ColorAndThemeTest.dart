
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ColorAndThemeTest extends StatefulWidget{
  const ColorAndThemeTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _ColorAndThemeState();
  }

}
class _ColorAndThemeState extends State<ColorAndThemeTest>{
  var _themeColor = Colors.teal; //当前路由主题色

  @override
  void initState() {
    super.initState();
    ///如何将颜色字符串转成 Color 对象
    ///Color(0xffdc380d); //如果颜色固定可以直接使用整数值
    /// //颜色是一个字符串变量
    /// var c = "dc380d";
    /// Color(int.parse(c,radix:16)|0xFF000000) //通过位运算符将Alpha设置为FF
    /// Color(int.parse(c,radix:16)).withAlpha(255)  //通过方法将Alpha设置为FF
    ///Color(int.parse("source",radix: 16)).withBlue(255);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return
      Scaffold(
      body:
     Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("  颜色跟随主题")
                ]
            ),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                    color: Colors.black
                ),
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>  //切换主题
            setState(() =>
            _themeColor =
            _themeColor == Colors.teal ? Colors.blue : Colors.teal
            ),
            child: const Icon(Icons.palette)
        ),
      ),
    )
   );

  }

}
