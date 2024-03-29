import 'package:flutter/material.dart';

class WrapLayout extends StatelessWidget{
  const WrapLayout({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body: /* Row(
        children: <Widget>[
          //右边溢出部分报错。这是因为Row默认只有一行，如果超出屏幕不会折行。我们把超出屏幕显示范围会自动折行的布局称为流式布局
          Text("xxx"*100)
        ],
      )*/
      const Wrap(
        spacing: 10.0, // 主轴(水平)方向间距
        runSpacing: 10.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.start, //沿主轴方向居中
        runAlignment: WrapAlignment.start,//纵轴方向的对齐方式
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('aaa'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
            label: Text('bbbb'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
            label: Text('ccc'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
            label: Text('dd'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('e')),
            label: Text('ffdf'),
          ),
        ],
      )
    );
  }


}