class Point{
  //每一个实例属性 变量都会有一个隐式的 get，非final 还有 set 和Kotlin一样
  int _x=0;//_表示私有属性
  int y=0;//共有属性可以直接访问
  int _z =0;

  int get x => _x; //x 是方法名

  set x(int x) => _x=x;

  int get z => _z;//z是方法名
  set z(int z) => _z=z;
/* //相当于
  set z(int z){
    _z=z;
  }*/


  //No private fields have been found to generate getters/setters for
  //只有私有属性

 //运算符重载， 定义+ 操作的行为 和kotlin一样
  Point operator +(Point other){
    var point = new Point();
    point._x = _x + other._x;
    return point;
  }

  //运算符重载， 定义- 操作的行为
  Point operator -(Point other){
    var point = new Point();
    point._x=_x-other._x;
    return point;
  }

  //运算符重载， 定义* 操作的行为
  Point operator *(Point other){
    var point = new Point();
    point._x=_x*other._x;
    return point;
  }

}


void main(){

  var p1 = Point();
  var p2 = Point();
  p1.x = 2;
  p2.x = 4;

  var p3= p1 + p2;
  print(p3.x);
  var p5= p1 * p2;
  print(p5.x);
  p3 = p1 + p2 + p3;

  print(p3.x);

  //灵活......
  var p4 = p3 -p1-p2;
  print(p4.x);

}