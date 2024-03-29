void main(){
  print("Hello World!");
  
  //1、Object： 与Java一样Object是所有类的基类，Object声明的变量可以是任意类型。（在 Dart 中 甚至连 数字、方法和 `null` 都是对象，比如int。）
  //Object可以声明为任何类型的对象、可以修改成其他类型的对象
  Object o = 1;
  o = "o";
  o = 2;

  // 2、var 在声明的变量赋值那一刻（编译期），就决定了它是什么类型。
 //a已经确定为num，不能再赋值字符串，编译错误
  var a = 1;
  //a = "a";
  //正确 var声明的变量b没有赋初始值时 则b可以改为任意类型数据。
  var b;
  b = 1;
  b = "a";
  b=0.5;

  //3、dynamic 不是在编译时候确定实际类型的, 而是在运行时。dynamic声明的变量行为与Object一样
   dynamic d = "777";
   d = 100;
  print(" $o\n $b\n $d\n");


  //4、变量是一个引用,未初始化的变量值是null。下面的name1、name2与name3的变量都引用了一个内容为 “666” 的 String 对象。
  var name;//未初始化的变量值是null
  Object name1="666";
  var name2="666";
  dynamic name3="666";
  print(" $name\n $name1\n $name2\n $name3");

  //5、final与const从使用上根本看不出区别，都不能修改变量的值。但是final是运行时常量，而const是编译器常量，它的值在编译期就可以确定，编译时常量能够让代码运行的更高效。被final或者const修饰的变量，变量类型可以省略
  //final、const都不能修改变量的值
  final int n = 1;
  //n  =2;
  const m = 1;
  //m = 2;

  //正确，已经确定的值
   const x = 1;
   const y = x + 5;
   //错误,final不能在编译时确定值，因此const也不能确定值
   final k = 1;
  // const j = k + 1;
  print(" y= $y\n");

}

class CONST{
  //6、类的变量可以为 `final` 但是不能是 `const` 。如果 const 变量在类中，需要定义为`static const`静态常量
  final f=1;
  //const c=1;//错误 Only static fields can be declared as const.
  static const sc=1;//正确
}