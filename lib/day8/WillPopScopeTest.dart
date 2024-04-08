
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class WillPopScopeTest extends StatefulWidget{
  const WillPopScopeTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _WillPopScopeState();
  }

}
class _WillPopScopeState extends State<WillPopScopeTest>{
  DateTime? lastPressTime;//上次点击时间

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
      body: WillPopScope(
        onWillPop: () async{
          if(lastPressTime==null || DateTime.now().difference(lastPressTime!)>const Duration(seconds: 2)){
            //两次点击间隔超过2秒则重新计时
            lastPressTime = DateTime.now();
           Fluttertoast.showToast(
            msg: "再按一次退出",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0
          );
            return false;
          }
          return true;
        },
        child: const Center(
          child: Text("2s内再次按键退出"),
        ),

      )
    );

  }

}
