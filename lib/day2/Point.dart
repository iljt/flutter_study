//包括类的定义 如果使用 _开头 意味着这个类是private(包可见)
class Point {
  //使用 _ 开始命名的变量 相当于Java的 private
   int _x=0;
   int y=0;

   /*Point(int _x,int y){
     this._x=_x;
     this.y=y;
   }*/

   Point(this._x,this.y);//相当于上面注释代码的Java方式写法 The default constructor is already defined.


  // 命名构造方法  命名更加直观的表示这个构造方法的作用与特性
   Point.Y(int y){
     this.y=y;
   }

  Point.X(int x){
    this._x=x;
  }



   //参数初始化列表 初始化你类当中的属性 可以不写方法体
   Point.fromMap(Map map): _x=map["x"],y=map["y"];

   //相当于
 /*   Point.fromMap(Map map){
     _x=map["x"];
     y=map["y"];
   }*/


   @override
  String toString() {
    return 'Point{_x: $_x, y: $y}';
  }



}

class View{
  View(int context,int attr);
  //重定向构造方法
  View.v(int context):this(context,0);
  //jva写法
 /*  View(int context){
    this(context,0);
  }*/

}

class ImmutabelPoint{
  final int x;
  final int y;
  // 常量构造方法 变量必须加上final声明为运行时常量
  const ImmutabelPoint(this.x,this.y);

  @override
  String toString() {
    return 'ImmutabelPoint{x: $x, y: $y}';
  }
}


class Manager{

 static  Manager _instance=new Manager._newInstance();
   // 工厂构造方法 必须返回一个 实例对象  // getInstance命名构造方法
   factory Manager.getInstance(){
     // ignore: unnecessary_null_comparison
     if(_instance == null){
       _instance = new Manager._newInstance();
     }
     return _instance;
   }

   //私有的 private的
  Manager._newInstance();
}

class Helper{
  static final Helper _instance = Helper._newInstance();

  factory Helper.getInstance(){
    return _instance;
  }

  Helper._newInstance();
}


