import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/day4/NamedRoute2.dart';
import 'package:flutter_study/day4/NewRoute.dart';
import 'package:flutter_study/day6/TransformWidget.dart';
import 'package:flutter_study/day7/TabBarViewTest.dart';

import 'day4/NamedRoute1.dart';
import 'day5/AliginLayout.dart';
import 'day5/ColumnLayout.dart';
import 'day5/FlexLayout.dart';
import 'day5/Layout.dart';
import 'day5/RowAndColumnLayout.dart';
import 'day5/RowLayout.dart';
import 'day5/StackLayout.dart';
import 'day5/WrapLayout.dart';
import 'day6/ClipWidget.dart';
import 'day6/ContainerWidget.dart';
import 'day6/ConWidget.dart';
import 'day6/DecoratedBoxWidget.dart';
import 'day6/FittedBoxWidget.dart';
import 'day6/PaddingWidget.dart';
import 'day6/ScaffoldWidget.dart';
import 'day7/AinimalListTest.dart';
import 'day7/CustomScrollViewTest.dart';
import 'day7/GirdViewTest.dart';
import 'day7/ListViewTest.dart';
import 'day7/NestedScrollViewTest.dart';
import 'day7/PageViewTest.dart';
import 'day7/ScrollControllerTest.dart';
import 'day7/ScrollViewWidget.dart';
import 'day7/SingleChildScrollViewTest.dart';


void main() => runApp(const WidgetApp());

class WidgetApp extends StatelessWidget {

  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute:(RouteSettings settings){

          return MaterialPageRoute(builder: (context){
            String? routeName = settings.name;
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            // 引导用户登录；其他情况则正常打开路由。
            return const NamedRoute1();
           }
          );

        },
      //给命名路由注册路由表
      //我们只需在路由表中注册一下BaseWidgetPage路由，然后将其名字作为MaterialApp的initialRoute属性值即可，该属性决定应用的初始路由页是哪一个命名路由
      //initialRoute:"home_page",加上这个报错
      routes: {
        "home_page":(BuildContext context) => const BaseWidgetPage(),
        "named_page1":(BuildContext context) => const NamedRoute1(),
        "named_page2":(BuildContext context) => const NamedRoute2(),
        "layout_page":(BuildContext context) => Layout(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "row_page":(BuildContext context) => RowLayout(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "row_and_column_page":(BuildContext context) => RowAndColumnLayout(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "wrap_page":(BuildContext context) => WrapLayout(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "stack_page":(BuildContext context) => StackLayout(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "flex_page":(BuildContext context) => FlexLayout(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "algin_page":(BuildContext context) => AliginLayout(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "column_page":(BuildContext context) => ColumnLayout(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "contain_page":(BuildContext context) => const ConWidget(),
        "pading_page":(BuildContext context) =>  PaddingWidget(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "decoratedbox_page":(BuildContext context) => DecoratedBoxWidget(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "transform_page":(BuildContext context) => TransformWidget(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "container_page":(BuildContext context) => ContainerWidget(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "clip_page":(BuildContext context) => ClipWidget(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "fittedBox_page":(BuildContext context) => FittedBoxWidget(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "scaffold_page":(BuildContext context) => const ScaffoldWidget(),
        "scrollview_page":(BuildContext context) => const ScrollViewWidget(),
        "singlechildscroll_page":(BuildContext context) => SingleChildScrollViewTest(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "listview_page":(BuildContext context) => ListViewTest(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "scrollcontroller_page":(BuildContext context) => const ScrollControllerTest(),
        "ainimallist_page":(BuildContext context) => const AinimalListTest(),
        "girdview_page":(BuildContext context) => const GirdViewTest(),
        "pageview_page":(BuildContext context) => PageViewTest(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "tabbarview_page":(BuildContext context) => TabBarViewTest(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "customScrollView_page":(BuildContext context) => CustomScrollViewTest(text: ModalRoute.of(context)!.settings.arguments.toString()),
        "nestedScrollView_page":(BuildContext context) => NestedScrollViewTest(text: ModalRoute.of(context)!.settings.arguments.toString()),

        //假设我们也想将上面路由传参示例中的NewRoute路由页注册到路由表中，以便也可以通过路由名来打开它。但是，由于NewRoute接受一个text 参数，我们在不改变NewRoute源码的前提下适配这种情况
        "new_route": (context){
          return NewRoute(text: ModalRoute.of(context)!.settings.arguments.toString());
        },

      },
      home:  Scaffold(
        appBar:  AppBar(
          title:  const Text(
            '基础Widget',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const BaseWidgetPage(),
      ),
    );
  }
}

class BaseWidgetPage extends StatefulWidget {
  const BaseWidgetPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BaseWidgetState();
  }

}

class _BaseWidgetState extends State<BaseWidgetPage>{
  //late Image image;
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  //定义一个controller
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _selectionController =  TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;


  @override
  void initState() {
    super.initState();
  /*  getExternalStorageDirectory().then((path){
      setState(() {
        image = Image.file(File("${path?.path}${Platform.pathSeparator}icon_home_top.jpeg"));
      });
    });*/
    //监听输入改变
    _unameController.addListener((){
      print(_unameController.text);
    });
    //设置默认值，并从第三个字符开始选中后面的字符
    _selectionController.text="hello world!";
    _selectionController.selection=TextSelection(
        baseOffset: 2,
        extentOffset: _selectionController.text.length
    );
    // 监听焦点变化
    focusNode1.addListener((){
      print("focusNode1= ${focusNode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    var img= const NetworkImage(
      "http://img.zcool.cn/community/01a7f7590cd5a3a8012145509a8335.jpg@2o.jpg",
    );
    return  Scrollbar(
        child: SingleChildScrollView(
      //横向滑动
        scrollDirection:Axis.vertical,child:
         Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
               Text("文本设置样式", style: _DefultStyle()),
              _RichTextBody(),
               Text("文本2", style: _DefultStyle()),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              const Image(image: AssetImage('assets/images/home/icon_home_add.png')),
              //构造函数
              Image.asset('assets/images/home/icon_home_menu.png'),
            //  image,
              const Icon(Icons.add,  size: 50,color: Colors.red),

            _flutterLogo(),
            const Image(
              image: NetworkImage('http://img.zcool.cn/community/01a7f7590cd5a3a8012145509a8335.jpg@2o.jpg'),
              width: 50.0,
              height: 50.0,
              ),
            //构造函数
            Image.network(
              "http://img.zcool.cn/community/01a7f7590cd5a3a8012145509a8335.jpg@2o.jpg",
              width: 50.0,
              height: 50.0,
            )
          ],
        ),
        ///Image构造函数
        ///const Image({
        ///   ...
        ///   this.width, //图片的宽
        ///   this.height, //图片高度
        ///   this.color, //图片的混合色值
        ///   this.colorBlendMode, //混合模式
        ///   this.fit,//缩放模式
        ///   this.alignment = Alignment.center, //对齐方式
        ///   this.repeat = ImageRepeat.noRepeat, //重复方式
        ///   ...
        /// })
        /// width、height：用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则。
        /// fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：
        /// fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
        ///cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
        ///contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
        ///fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
        ///fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
        ///none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分

        SingleChildScrollView(
            child: Column(
            children: <Image>[
                Image(
                  image: img,
                  height: 50.0,
                  width: 100.0,
                  fit: BoxFit.fill,
                ),
                Image(
                  image: img,
                  height: 50,
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.fitWidth,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.fitHeight,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 50.0,
                  fit: BoxFit.scaleDown,
                ),
                Image(
                  image: img,
                  height: 50.0,
                  width: 100.0,
                  fit: BoxFit.none,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.difference,
                  fit: BoxFit.fill,
                ),
                Image(
                  image: img,
                  width: 100.0,
                  height: 200.0,
                  repeat: ImageRepeat.repeatY ,
                 )
                ].map((e){
                return Row(
                    children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                            width: 100,
                            child: e,
                        ),
                  ),
                   Text(e.fit.toString())
                  ],
                 );
                 }).toList()
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Switch(
              value: _switchSelected,//当前状态
              activeColor: Colors.green, //选中时的颜色
              onChanged:(value){
                //重新构建页面
                setState(() {
                  _switchSelected=value;
                });
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged:(value){
                setState(() {
                  _checkboxSelected=value!;
                });
              } ,
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.blue, //选中时的颜色
              onChanged:(value){
                setState(() {
                  _checkboxSelected=value!;
                });
              } ,
            )
          ],
        ),
        Scrollbar(child: SingleChildScrollView(
             //横向滑动
            scrollDirection:Axis.horizontal,child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
            ElevatedButton(child: const Text("非命名路由"), onPressed: () async {
              debugPrint("非命名路由 onPressed");
              //MaterialPageRoute继承自PageRoute类，PageRoute类是一个抽象类，表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建及切换时过渡动画的相关接口及属性。MaterialPageRoute 是 Material组件库提供的组件，它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画
              //MaterialPageRoute 构造函数的各个参数的意义
              //builder 是一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例。
              // settings 包含路由的配置信息，如路由名称、是否初始路由（首页）。
              // maintainState：默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为 false。
              // fullscreenDialog表示新的路由页面是否是一个全屏的模态对话框，在 iOS 中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）。

              //Navigator是一个路由管理的组件，它提供了打开和退出路由页方法。Navigator通过一个栈来管理活动路由集合。通常当前屏幕显示的页面就是栈顶的路由。Navigator提供了一系列方法来管理路由栈
             // Navigator类中第一个参数为context的静态方法都对应一个Navigator的实例方法， 比如Navigator.push(BuildContext context, Route route)等价于Navigator.of(context).push(Route route) ，下面命名路由相关的方法也是一样的。
             /* Navigator.push(context, MaterialPageRoute(builder: (BuildContext conetxt){
                 return const NewRoute();}),
              );*/
              //ambda表达式， Closure闭包
              var result = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext conetxt) =>  const NewRoute(text:"我是传过去的参数888") ));
              print("非命名路由返回值: $result");
             },
            ),
            //文本按钮，默认背景透明并不带阴影。按下后，会有背景色
            TextButton(onPressed: () async{
              debugPrint("命名路由1 onPressed");
              var result = await Navigator.of(context).pushNamed("named_page1",arguments: "命名路由1传递的参数111111");
              print("命名路由1返回值: $result");
            }, child: const Text("命名路由")),
            //OutlinedButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
            OutlinedButton(onPressed: () async{
              debugPrint("命名路由2 onPressed");
              var result = await Navigator.of(context).pushNamed("named_page2",arguments: "命名路由2传递的参数222222");
              print("命名路由2返回值: $result");
            }, child: const Text("命名路由2")),
            //IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            //ElevatedButton、TextButton、OutlinedButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("适配非命名路由为命名路由打开NewRoute"),
              onPressed: () async{
                print("发送");
                var result = await Navigator.of(context).pushNamed("new_route",arguments: "适配非命名路由为命名路由传递的参数ooo");
                print("适配非命名路由为命名路由返回值: $result");
              },
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("布局组件"),
              onPressed: (){
                print("布局组件");
                Navigator.of(context).pushNamed("layout_page",arguments: "布局组件");

              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: const Text("容器组件"),
              onPressed: (){
                Navigator.of(context).pushNamed("contain_page",arguments: "容器组件");
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: const Text("可滚动组件"),
              onPressed: (){
                Navigator.of(context).pushNamed("scrollview_page",arguments: "ScrollView");
              },
            ),
          ],
        ))),
        Column(
          //value表示当前的进度，取值范围为[0,1]；如果value为null时则指示器会执行一个循环动画（模糊进度）；当value不为null时，指示器为一个具体进度的进度条。
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.red),
            ),
            //进度条显示50%
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: 0.6,
            ),
            // 模糊进度条(会执行一个旋转动画)
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.red),
              strokeWidth: 10,
            ),
          //进度条显示50%，会显示一个半圆
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            //通过尺寸限制类Widget，如ConstrainedBox、SizedBox来指定尺寸
            // 线性进度条高度指定为3
            SizedBox(
              height:20,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.green),
                value: .5,
              ),
            ),
         // 圆形进度条直径指定为100
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.redAccent),
                value: .7,
              ),
            ),
          ],

        ),
        Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: focusNode1,//关联focusNode1
              decoration: const InputDecoration(
                  labelText: "input1"
              ),
            ),
            TextField(
              focusNode: focusNode2,//关联focusNode2
              decoration: const InputDecoration(
                  labelText: "input2"
              ),
            ),
            Builder(builder: (ctx) {
              return Column(
                children: <Widget>[
                  ElevatedButton(
                    child: const Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      focusScopeNode ??= FocusScope.of(context);
                      //相当于
                      //if(null == focusScopeNode){
                      //  focusScopeNode = FocusScope.of(context);
                      //  }
                      focusScopeNode?.requestFocus(focusNode2);
                    },
                  ),
                  ElevatedButton(
                    child: const Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
            ),
          ],
        ),
        Column(
          children: [
            TextField(
              //onChanged是专门用于监听文本变化，而controller的功能却多一些，除了能监听文本变化外，它还可以设置默认值、选择文本
              controller: _selectionController, //设置controller
              onChanged: (String value) {
                print("onChange: $value");
              },
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "TextSelection",
                  hintText: "xxxxxx",
                  prefixIcon: Icon(Icons.person)
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                // 下滑线浅灰色，宽度1像素
                  border: Border(bottom: BorderSide(color: Colors.red, width: 1.0))
              ),
              child:  TextField(
                  controller: _unameController, //设置controller
                  onChanged: (String value) {
                    print("onChange: $value");
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "电子邮件地址",
                      prefixIcon: Icon(Icons.nat_rounded),
                      border: InputBorder.none //隐藏下划线
                  )
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,//隐藏输入文本
            ),
          ],
        ),
      ],
     )
    )
    );
  }
}


Widget _RichTextBody() {
  var textSpan = const TextSpan(
    text: "Hello",
    style: TextStyle(color: Colors.red),
    children: [
      TextSpan(text: "Flu", style: TextStyle(color: Colors.blue)),
      TextSpan(text: "uter", style: TextStyle(color: Colors.yellow)),
    ],
  );
  //Text.rich(textSpan);
  return RichText(text: textSpan);
}

TextStyle _DefultStyle() {
  return const TextStyle(
    //颜色
      color: Colors.red,
      //字号 默认14
      fontSize: 18,
      //粗细
      fontWeight: FontWeight.w800,
      //斜体
      fontStyle: FontStyle.italic,
      //underline：下划线，overline：上划线，lineThrough：删除线
      decoration: TextDecoration.lineThrough,
      decorationColor: Colors.black,
      //solid：实线，double：双线，dotted：点虚线，dashed：横虚线，wavy：波浪线
      decorationStyle: TextDecorationStyle.solid);
}

Widget _flutterLogo() {
  return const FlutterLogo(
    //大小
    size: 100,
    //logo颜色 默认为 Colors.blue
    //markOnly：只显示logo，horizontal：logo右边显示flutter文字，stacked：logo下面显示文字
    style: FlutterLogoStyle.stacked,
    //logo上文字颜色
    textColor: Colors.blue,
  );
}


