void main() {
  // ignore: slash_for_doc_comments
  /**
   * 1、一般方法
   */
  int add(int i, int j) {
    return i + j;
  }

  //也可以选择忽略类型(不推荐)
  add1(i, j) {
    return i + j;
  }

  //对于只有一个表达式的方法，可以选择使用缩写语法来定义：
  add2(i, j) => i + j;
  //在箭头 (=>) 和分号 (;) 之间只能使用一个 表达式

  /**
   * 2、一等方法对象
   *    Dart是一种真正的面向对象的语言，所以即使是函数也是对象，并且有一个类型Function。
   *    这意味着函数可以赋值给变量或作为参数传递给其他函数，这是函数式编程的典型特征。
   */

  var list = [1, 2, 3];
  //将 print方法 作为参数传递给forEach
  list.forEach(print);
  //可以将方法赋值给一个变量 类型为Function
  var p = print;
  list.forEach(p);

  //方法可以有两种类型的参数：必需的和可选的。 必需的参数需要在参数列表前面， 后面再定义可选参数。
  /**
   * 3、可选命名参数
   * 把方法的参数放到 `{}` 中就变成可选 命名参数
   *
   */

  int add4({var i, var j}) {
    if (i == null || j == null) {
      return 0;
    }
    return i + j;
  }
  print("------------------------------------");
  //无必须参数 这里把add放add方法作为print方法的参数
  //不需要再像java一样，写一大堆的重载函数，并且能够提供参数默认值。
  print(add4());
  //选择传递参数
  print(add4(i: 1));
  print(add4(j: 2));
  //位置无关
  print(add4(i: 1, j: 2));
  print(add4(j: 1, i: 2));

  // ignore: slash_for_doc_comments
  /**
   * 4、可选的位置参数
   *    包装一组函数参数，用[]标记为可选的位置参数，并放在参数列表的最后面 可选的位置参数传值时按照参数位置顺序传递
   */
  String say(String from, String msg, [var device, var str]) {
    var result = '$from says $msg';
    if (device != null && str != null) {
      result = '$result has a $device and $str';
    }
    return result;
  }

  //下面是一个不带可选参数调用这个函数的例子：
  print(say("tom", "jone"));

  //下面是一个带可选参数调用这个函数的例子：
  print(say("tom", "jone", "smoke"));
  print(say("tom", "jone", "smoke", "junk"));

  // ignore: slash_for_doc_comments
  /**
   * 5、默认参数值
   * 	在定义方法的时候，可选参数可以使用 `=` 来定义可选参数的默认值。
   */
  int add6({int i = 1, int j = 2}) => i + j;
  int add7([int i=1,int j=2])=>i+j;
  //可选命名参数 与位置无关
  print(add6());
  print(add6(j:10));
  print(add6(j:20,i:11));
  print(add6(i:11,j:20));
  //可选的位置参数 与位置有关
  print(add7(23));
  print(add7(2,3));

  /**
   * 6、匿名方法
   * 没有名字的方法，称之为匿名方法，也可以称之为 lambda 或者 closure 闭包。
   */
  print("-----------");
  var list1=["ddd",1,2,3];

  list1.forEach((element) {
    print(element);
  });

  //相当于
  void fun(Object o){
    print(o);
  }
  list1.forEach(fun);
}
