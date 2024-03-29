import 'package:flutter/material.dart';

class FlexLayout extends StatelessWidget{
  const FlexLayout({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(text),
      ),
      body:Column(
        children: <Widget>[
          //
          //Flex的两个子widget按1：3来占据水平空间
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              //Expanded 只能作为 Flex 的孩子（否则会报错），它可以按比例“扩伸”Flex子组件所占用的空间。
              // 因为 Row和Column 都继承自 Flex，所以 Expanded 也可以作为它们的孩子
              //flex参数为弹性系数，如果为 0 或null，则child是没有弹性的，即不会被扩伸占用的空间。
              // 如果大于0，所有的Expanded按照其 flex 的比例来分割主轴的全部空闲空间
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              height: 300.0,
              //Flex的三个子widget，在垂直方向按3：2：1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }


}