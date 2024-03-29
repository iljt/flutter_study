import 'package:flutter/material.dart';

class StackLayout extends StatelessWidget{
  const StackLayout({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body: //通过ConstrainedBox来确保Stack占满屏幕
    /*  ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          fit: StackFit.loose,//用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。
        //  textDirection: TextDirection.ltr,//和Row、Wrap的textDirection功能一样，都用于确定alignment对齐的参考系，即：textDirection的值为TextDirection.ltr，则alignment的start代表左，end代表右，即从左往右的顺序；textDirection的值为TextDirection.rtl，则alignment的start代表右，end代表左，即从右往左的顺序
        //  clipBehavior: Clip.hardEdge,//决定对超出Stack显示空间的部分如何剪裁，Clip枚举类中定义了剪裁的方式，Clip.hardEdge 表示直接剪裁，不应用抗锯齿
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            //Hello world没有指定定位，并且alignment值为Alignment.center，所以它会居中显示
            Container(
              color: Colors.red,
              child: const Text("Hello world",style: TextStyle(color: Colors.white)),
            ),
            //Positioned left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离。width和height用于指定需要定位元素的宽度和高度。注意，Positioned的width、height 和其他地方的意义稍微有点区别，此处用于配合left、top 、right、 bottom来定位组件，
            // 举个例子，在水平方向时，你只能指定left、right、width三个属性中的两个，如指定left和width后，right会自动算出(left+width)，如果同时指定三个属性则会报错，垂直方向同理
           //只指定了水平方向的定位(left)，所以属于部分定位，即垂直方向上没有定位，那么它在垂直方向的对齐方式则会按照alignment指定的对齐方式对齐，即垂直方向居中
            const Positioned(
              left: 20.0,
              child: Text("I am Jack"),
            ),
            ////只指定了垂直方向的定位(top)，所以属于部分定位，即水平方向上没有定位，那么它在水平方向的对齐方式则会按照alignment指定的对齐方式对齐，即水平方向居中
            const Positioned(
              top: 20.0,
              child: Text("Your friend"),
            )
          ],
        ),
      )*/

      //由于第二个子文本组件没有定位，所以fit属性会对它起作用，就会占满Stack。由于Stack子元素是堆叠的，所以第一个子文本组件被第二个遮住了，而第三个在最上层，所以可以正常显示
      Stack(
        alignment:Alignment.center ,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          const Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Container(color: Colors.red,child: const Text("Hello world",style: TextStyle(color: Colors.white)),
          ),
          const Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }


}