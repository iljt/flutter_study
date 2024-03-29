//没有办法表示要传递的这个方法参数 这个方法需要什么参数，返回什么
void fun(Function f){
  f(1);
}

//这种写法相当于fun3的匿名方式 可以表达 我这个方法接受的方法参数f1 需要什么类型的变量返回什么
//但是写起来很麻烦  相当于kotlin的高阶函数
int  fun2(int f1(int i,int j)){
  return f1(2,5);
}


//定义一个类型： F 类型， 这个F类型其实就是一个方法，接受两个int参数，返回String
//相当于把fun2的参数int f1(int i,int j)提取出来，再传给fun3
//typedef定义一个类型
typedef String F(int i,int j);


String fun3(F f){
  return f(2,5);
}

// Java中使用接口作为回调接口
class OnClickListener{
  void onClick(){}
}

class Button{
  void setOnClickLitener(OnClickListener onClickListener){}
}

//Dart中可以直接使用回调方法
typedef void onClick();

class TextView {
  void setOnClickLitener(onClick onClickListener){
    onClickListener();
  }
}




void main(){
  // 方法都是对象，可以赋值给Function变量
   Function f=fun;
   print(f);
   int f2= fun2((i, j) {
     return i*j;
   });
   print(f2);

   String s1=fun3((i, j){
     return (i*j).toString();
   });

   //另外一种写法 匿名方法， lambda表达式， Closure闭包
   String s2=fun3((i, j) => (i*j).toString());
   print(s1);
   print(s2);

}