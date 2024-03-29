import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipWidget extends StatelessWidget{
  const ClipWidget({super.key, required this.text});
  final String text;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body:
      // 头像
     Center(
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/user/icon_logo.png', width: 60.0), //不剪裁
          ClipOval(child: Image.asset('assets/images/user/icon_logo.png', width: 60.0)),//剪裁为圆形
          ClipRRect( //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/user/icon_logo.png', width: 60.0),
          ),
          //通过Align设置widthFactor为0.5后，图片的实际宽度等于60×0.5，即原宽度一半，但此时图片溢出部分依然会显示，所以第一个“你好世界”会和图片的另一部分重合，为了剪裁掉溢出部分，我们在第二个Row中通过ClipRect将溢出部分剪裁掉了
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,//宽度设为原来宽度一半，另一半会溢出
                child: Image.asset('assets/images/user/icon_logo.png', width: 60.0),
              ),
              const Text("你好世界", style: TextStyle(color: Colors.green),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(//将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,//宽度设为原来宽度一半
                  child: Image.asset('assets/images/user/icon_logo.png', width: 60.0),
                ),
              ),
              const Text("你好世界",style: TextStyle(color: Colors.green))
            ],
          ),
        ],
      ),
    )
      //为了看清图片实际所占用的位置，我们设置一个红色背景
    /*  Center(child:  DecoratedBox(
        decoration: const BoxDecoration(
            color: Colors.red
        ),
        child: ClipRect(
          clipper: MyClipper(), //使用自定义的clipper
          child: Image.asset('assets/images/user/icon_logo.png', width: 60.0),
        ),
      )
    )*/

    );
  }


}
//如果我们想剪裁子组件的特定区域，比如，在上面示例的图片中，如果我们只想截取图片中部40×30像素的范围应该怎么做？这时我们可以使用CustomClipper来自定义剪裁区域
//getClip()是用于获取剪裁区域的接口，由于图片大小是60×60，我们返回剪裁区域为Rect.fromLTWH(10.0, 15.0, 40.0, 30.0)，即图片中部40×30像素的范围。
// shouldReclip() 接口决定是否重新剪裁。如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），那么变化后应该返回true来重新执行剪裁。
class MyClipper extends CustomClipper<Rect> {

  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;

}