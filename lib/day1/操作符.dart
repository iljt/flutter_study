void main(){
  /**
   * 1、类型判定操作符
   * as   类型转换
   * is  如果对象是指定的类型返回 True
   * is! 如果对象是指定的类型返回 False
   */

  // `num`是数字类型的父类，有两个子类` int`和 `double`。
  num j = 6;
  //类型转换 不支持 java的： (int)强转写法
  int i = j as int;
  print(i);

  Object o= 1;
  //没有java的 instantof ，需要使用is
  if (o is int) {
    print("o的类型是int");
  }
  //不属于int类型则命中if
  if (o is! int) {
    print("o的类型不是int");
  }

  /**
   * 2、赋值操作符  `=`、`+=`、`\=`、`*=`这些和java一样
   */
  // b ??= value; // 如果不是 null，则 b 的值保持不变，如果 b 是 null，则 value 赋值给 b
  var b;//未初始化的变量值是null
  b ??= "xxx";
  print("b= $b");


  /**
   * 3、条件表达式    `=`、`+=`、`\=`、`*=`这些和java一样
      Dart 有两个特殊的操作符可以用来替代 if-else 语句：
      1、condition ? expr1 : expr2
      如果 condition 是 true，执行 expr1(并返回执行的结果)； 否则执行 expr2并返回其结果，和java一样。

      2、 expr1 ?? expr2
      如果 expr1 不为null，返回其值,如果expr1为null 执行 expr2 并返回其结果
   */
  var  k;
  var v = k ?? "666";
  print("v= $v");

  /**
   * 	4、级联操作符 (`..`)  可以在同一个对象上 连续调用多个函数以及访问成员变量。 使用级联操作符可以避免创建 临时变量， 并且写出来的代码看起来 更加流畅：
   */
  //StringBuffer write就是Java的append
   var sb = StringBuffer(); //和kotlin一样对象的创建关键字new也可以省略
   sb..write("你好")..write("世界！") ;
   print("sb= $sb");

  /**
   *  5、安全操作符
   */
  var str="222";
  //如果str为null，就返回null 不为null返回str.length 和kotlin一样
  print(str?.length);
}