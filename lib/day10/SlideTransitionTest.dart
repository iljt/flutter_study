
import 'package:flutter/material.dart';
import 'package:flutter_study/day10/slidetransition/SlideTransitionX.dart';

class SlideTransitionTest extends StatefulWidget{
  const SlideTransitionTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _SlideTransitionState();
  }

}
class _SlideTransitionState extends State<SlideTransitionTest>{
  int _count =0;

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
          body:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return SlideTransitionX(
                      direction: AxisDirection.down, //上入下出
                      position: animation,
                      child: child,
                    );
                  },

               /* AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    //执行缩放动画
                    return ScaleTransition(child: child, scale: animation);
                  },*/
                  child: Text(
                    '$_count',
                    //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                    key: ValueKey<int>(_count),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                ElevatedButton(
                  child: const Text('+1',),
                  onPressed: () {
                    setState(() {
                      _count += 1;
                    });
                  },
                ),
              ],
            ),
          )

    );

  }

}
