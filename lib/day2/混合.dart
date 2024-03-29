mixin A{

  void a(){
    print("A 的a方法");
  }

}

mixin class B{

  void a(){
    print("B 的a方法");
  }

  void b(){
    print("B 的b方法");
  }
}


//C 就是A B的混合类
//class C = Object with A, B;

// 满足了我们的多继承的需求
class C with A,B{
  int x=0;
  int y=0;

  //可以有构造函数
  C(this.x,this.y);

  // 重写了 混合类的a方法
/*  void a(){
    print("C 的a方法");
  }*/

  void c(){
    print("C 的c方法");
  }

}

//被mixin(混入)的类不能有构造函数
mixin  D implements A,B{
  int x=0;
  int y=0;

  //报错Mixins can't declare constructors.
 /* D(int x,int y){
    this.x=x;
    this.y=y;
  }*/
}

void main(){
  //1、自身是第一优先级
  //2、如果自身没有对应的方法，就从with最右边开始查找方法
  //即如果c重写了a方法，则调用C的a方法，否則依次从with的最右边B开始查找有没有a方法，有则调用B的a方法，否则查找A有没有a方法，有则调用A的a方法。
  var c=new C(1,1);
  c.a();
}