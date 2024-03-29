import 'package:flutter_study/day2/Point.dart';


void main(){
  //构造方式1
  var point=new Point(1, 1);
  print(point.toString());
  //构造方式2
  var map=new Map();
  map["x"]=2;
  map["y"]=2;
  var point1= Point.fromMap(map);
  print(point1.toString());
  //构造方式3
  var point3=new Point.X(3);
  print(point3);
  //构造方式4
  var point4=new Point.Y(4);
  print(point4);

  print("---------------------");
  //1、使用  new 来创建 常量构造方法的 对象 就和普通的对象没有区别
  //2、使用const 来创建多个对象，传递参数一样 表示 这几个对象是同一个 编译期常量 对象 （必须定义常量构造函数）

  var immutablepoint1=new ImmutabelPoint(1,1);
  var immutablepoint2=new ImmutabelPoint(1,1);
  print(immutablepoint1.hashCode);
  print(immutablepoint2.hashCode);
  print(immutablepoint1==immutablepoint2);

  print("---------------------");
  var immutablepoint3=const ImmutabelPoint(1,1);
  var immutablepoint4=const ImmutabelPoint(1,1);
  print(immutablepoint3.hashCode);
  print(immutablepoint4.hashCode);
  print(immutablepoint3==immutablepoint4);

  print("---------------------");

  //工厂构造方法
  var manager=new Manager.getInstance();
  print(manager);

  var helper=Helper.getInstance();
  print(helper);

}