
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogTest extends StatefulWidget{
  const DialogTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _DialogState();
  }

}
class _DialogState extends State<DialogTest>{
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
      body:
      ///Navigator.of(context).pop(result)返回的result值  点击该按钮后弹出对话框
      ElevatedButton(
        child: const Text("对话框1"),
        onPressed: () async {
          //弹出对话框并等待其关闭
        /*  bool? delete = await showDeleteConfirmDialog1();
          if (delete == null) {
            print("取消删除");
          } else {
            print("已确认删除");
            //... 删除文件
          }*/
         /// 实际上AlertDialog和SimpleDialog都使用了Dialog类。由于AlertDialog和SimpleDialog中使用了IntrinsicWidth来尝试通过子组件的实际尺寸来调整自身尺寸，这就导致他们的子组件不能是延迟加载模型的组件（如ListView、GridView 、 CustomScrollView等）
         /* showListDialog();*/
         ///对话框中状态改变,因此最好的做法是将context的“范围”缩小，也就是说只将Checkbox的Element标记为dirty
        /* showStatusChangeConfirmDialog();*/
          /// 弹出底部菜单列表模态对话框
         /* int? type = await showBottomSheet();
          print(type);*/
          ///自定义宽度加载框
         /*  showLoadingDialog();*/
          ///自定义对话框
          purchase(context,"1");
        },
      ),
    );

  }

  // 弹出对话框
  Future<bool?> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: const Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: const Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showListDialog() async {
    int? index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            const ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  Future<bool?> showStatusChangeConfirmDialog() {
    bool _withTree = false;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  const Text("同时删除子目录？"),
                  ///如果context我们用的是对话框的根context，会导致整个对话框UI组件全部rebuild，因此最好的做法是将context的“范围”缩小，也就是说只将Checkbox的Element标记为dirty
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (bool? value) {
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        },
                      );
                    },
                  )

                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(_withTree);
                if (_withTree != null) {
                  print("_withTree：$_withTree");
                }
              },
            ),
          ],
        );
      },
    );

  }

  Future<int?> showBottomSheet() async{
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
       return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
       /// 如果我们嫌Loading框太宽，想自定义对话框宽度，这时只使用SizedBox或ConstrainedBox是不行的，原因是showDialog中已经给对话框设置了最小宽度约束，
        /// 根据“尺寸限制类容器”，我们可以使用UnconstrainedBox先抵消showDialog对宽度的约束，然后再使用SizedBox指定宽度，代码如下
       /*return const UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 250,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(value: .8,),
                  Padding(
                    padding: EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );*/
      },
    );
  }


  void purchase(context, status) {
    showDialog(
      // 传入 context
        context: context,
        // 构建 Dialog 的视图
        builder: (_) => Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 40, vertical:100/* ScreenUtil.screenHeight / 3*/),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: 167,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          status == '1' ? '取消发布' : '是否重新发布',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF333333),
                              decoration: TextDecoration.none),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        status == '1'
                            ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 21),
                          child: const Text(
                            '取消发布后，您的求购信息将不可见，您可以在取消后重新发布。 ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF333333),
                                decoration: TextDecoration.none),
                          ),
                        )
                            : Container(),
                        const SizedBox(
                          height: 20,
                        ),
                       // MdGaps.line,
                        Container(
                          color: const Color(0XFFEEEEEE),
                          width: 250,
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                 child:  Container(
                                   alignment: Alignment.center,
                                   padding: const EdgeInsets.symmetric(horizontal: 21),
                                   child: const Text(
                                     '关闭 ',
                                     style: TextStyle(
                                         fontSize: 18,
                                         fontWeight: FontWeight.w500,
                                         color: Color(0XFF333333),
                                         decoration: TextDecoration.none),
                                   ),
                                 ),
                                onTap:(){
                                   Navigator.pop(context);
                                } ,
                             )

                            ),
                            Container(
                              color: const Color(0XFFEEEEEE),
                              width: 1,
                              height: 36,
                            ),
                            Expanded(
                                child:GestureDetector(
                                onTap:() => Navigator.pop(context),
                                  child:  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(horizontal: 21),
                                    child: Text(
                                      status == '1' ? '取消发布' : '重新发布',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0XFFF36926),
                                          decoration: TextDecoration.none),
                                    ),
                                  )
                                )
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }

}
