import 'dart:ffi';

void main() {
  /**
   *   1、Numbers（数值）
   *   num是数字类型的父类，有两个子类int和 double。
   */
  num n = 6;
  num d = 6.11;
  print(" n= $n\n d= $d ");

  /**
   * 2、Strings（字符串）
   * Dart 字符串是 UTF-16 编码的字符序列。 可以使用单引号或者双引号来创建字符串，单引号和双引号可以嵌套使用，否则需要使用`\`进行转义。字符串中也可以引用变量与表达式。
   */
  var name = 'jjl';
  //1.如果插入一个简单的标识符，而后面没有紧跟更多的字母数字文本，那么{}应该被省略。
  var a = "my name is $name!";
  var b = "my name is ${name.toUpperCase()}!";
  //2.与Java一样可以使用 `+` 操作符来把拼接字符串，也可以把多个 字符串放到一起来实现同样的功能：
  var c = "my name is " + "xxx";
  print(" a= $a\n b= $b\n c= $c");
  //3.使用三个单引号或者双引号可以 创建多行字符串对象 与kotlin一样
  var e = """dsf adafad 
  dsfdasfdasffdasfdafdf
  rueithrutrtorotro9toi    
             """;
  print(" e= $e");
  //4.提供一个 `r` 前缀可以创建一个 “原始 raw” 字符串
  print(r"换行符：\n"); // 换行符：\n  r:不需要转义
  print("换行符：\\n"); // 换行符：\n 单引号与双引号一样,用`\`进行转义
  print('换行符：\\n'); // 换行符：\n 单引号与双引号一样用`\`进行转义

  /**
   * 3、Booleans（布尔值） Dart 有一个名字为 `bool` 的类型。
   * 只有两个对象是布尔类型的：`true` 和 `false` 。这一点和Java没有太大的区别。
   */
  var bool= "false";
  print("bool= $bool");

  /**
   *  4、Lists（列表）
   *  几乎所有编程语言中最常见的集合可能是数组或有序对象组。在Dart中，数组就是`List`对象。对`List`进行遍历也和Java一样。
   *  数组里面的数据类型可以不一致
   */
  var list = [1, "sssss", 3, 4, 5];
  //Lists 的下标索引从 0 开始，第一个元素的索引是 0. list.length - 1 是最后一个元素的索引
  print(list[list.length - 1]);
  //修改元素
  list[0] = 2;
  print(list);

  //使用new（实际上new可以省去）
  var list1 = new List.filled(5, 222);
 // list1[0].add(499); //报错The method 'add' isn't defined for the type 'int'.
  print(list1);

  /// All elements of the created list share the same [fill] value.
  var shared = List.filled(3, []);
  shared[0].add(499);
  print(shared); // => [[499], [499], [499]]

  //在 list 字面量之前添加 const 关键字，可以 定义一个不变的 list 对象（编译时常量）
  var list2 = const [1, 2, 3];
  //list2.add(5);//运行报错，list不可变 Cannot add to an unmodifiable list
  print(list2);

  //遍历List.of接受另外一个数组
  var list3 = List.of(["121", 2, 4.5]);
  //遍历方式1
  list3.forEach((element) {
    print(element);
  });
  print("-----------");
  //类似kotlin方式的遍历
  //遍历方式2
  for (var value in list3) {
    print(value);
  }

  /**
   * 5、Maps（映射集合）
   */
  //方式1:直接声明，用{}表示，里面写key和value，每组键值对中间用逗号隔开
  var companys = {'a': '阿里巴巴', 't': '腾讯', 'b': '百度'};
  //方式2
  var companys2 = new Map();//new可以省略
  //赋值
  companys2['a'] = '阿里巴巴';
  companys2['t'] = '腾讯';
  companys2['b'] = '百度';

//添加元素
  companys['j'] = '京东';
//获取与修改元素
  var com = companys['d'];

  ///没有对应的key返回null
  companys['a'] = 'alibaba';
  companys2["b"] = "baidu" ;
  print("companys=$companys companys2=$companys2 com=$com");
  //遍历key
  companys.keys.forEach((element) {
    print(element);
  });
  //遍历value
  companys.values.forEach((element) {
    print(element);
  });
  //遍历key和value
  companys.forEach((key, value) {
    print("key=$key value=$value");
  });
  //与List一样，在 map字面量之前添加 `const` 关键字，可以 定义一个 编译时常量 的 map
  var companys4 = const {'a': '阿里巴巴', 't': '腾讯', 'b': '百度'};
  //companys4["t"]="头条";//报错 companys4不可变//Unsupported operation: Cannot set value in unmodifiable Map

  //实际上在Flutter开发中Runes与下一个Symbols可能永远也不会用到,可以了解一下。
  /**
   * 6、Runes（用于在字符串中表示Unicode字符）
   * Unicode为世界上所有的书写系统中使用的每个字母，数字和符号定义了唯一的数值。 Dart 字符串是 UTF-16 位代码单元字符序列， 所以在字符串中表达 32位 Unicode 值需要 新的语法。Runes就是UTF-32字符集的string 对象。
   * 表达Unicode代码点的常用方法是\uXXXX，其中XXXX是4位十六进制值。要指定多于或少于4个十六进制数字，需要将值放在大括号中。
   */
  var clapping = '\u{1f44f}';

  ///5个16进制 需要使用{}
  print(clapping); //👏
  //获得 16位代码单元
  print(clapping.codeUnits); //[55357, 56399]
  //获得unicode代码
  print(clapping.runes.toList()); //[128079]

  //fromCharCode 根据字符码创建字符串
  print(String.fromCharCode(128079));
  print(String.fromCharCodes(clapping.runes));
  print(String.fromCharCodes([55357, 56399]));
  print(String.fromCharCode(0x1f44f));

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(String.fromCharCodes(input));

  /**
   *   7、Symbols
   *   操作符标识符，可以看作C中的宏。表示编译时的一个常量
   */

  var i = #A; //常量​
  print(i);
  switch(i){
    case #A:
      print("A");
      break;
    case #B:
      print("B");
      break;
  }
  var y = Symbol("y");
  print(y==#y); ///true
}
