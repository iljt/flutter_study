
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*Flutter预置的动画过渡组件
  AnimatedPadding	在padding发生变化时会执行过渡动画到新状态
  AnimatedPositioned	配合Stack一起使用，当定位状态发生变化时会执行过渡动画到新的状态。
  AnimatedOpacity	在透明度opacity发生变化时执行过渡动画到新状态
  AnimatedAlign	当alignment发生变化时会执行过渡动画到新的状态。
  AnimatedContainer	当Container属性发生变化时会执行过渡动画到新的状态。
  AnimatedDefaultTextStyle	当字体样式发生变化时，子组件中继承了该样式的文本组件会动态过渡到新样式。*/
class AnimalTransitionTest extends StatefulWidget{
  const AnimalTransitionTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _AnimalTransitionState();
  }

}
class _AnimalTransitionState extends State<AnimalTransitionTest>{
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = const TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;
  double _opacity = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var duration = const Duration(milliseconds: 400);
    return
      Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _padding = 20;
                });
              },
              child: AnimatedPadding(
                duration: duration,
                padding: EdgeInsets.all(_padding),
                child: const Text("AnimatedPadding"),
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: duration,
                    left: _left,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _left = 100;
                        });
                      },
                      child: const Text("AnimatedPositioned"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                duration: duration,
                alignment: _align,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _align = Alignment.center;
                    });
                  },
                  child: const Text("AnimatedAlign"),
                ),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _height = 150;
                    _color = Colors.blue;
                  });
                },
                child: const Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDefaultTextStyle(
              style: _style,
              duration: duration,
              child: GestureDetector(
                child: const Text("hello world"),
                onTap: () {
                  setState(() {
                    _style = const TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                    );
                  });
                },
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: duration,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  setState(() {
                    _opacity = 0.2;
                  });
                },
                child: const Text(
                  "AnimatedOpacity",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: e,
            );
          }).toList(),
        ),
      )
    );
  }
}
