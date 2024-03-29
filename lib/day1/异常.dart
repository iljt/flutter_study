import 'dart:ffi';

void main(){
   /*异常
   和 Java 不同的是，所有的 Dart 异常是非检查异常。 方法不一定声明了他们所抛出的异常， 并且不要求你捕获任何异常。*/

   //1.Dart 提供了 `Exception`和`Error` 类型， 以及一些子类型。你还 可以定义自己的异常类型。
   //但是， Dart 代码可以 抛出任何非 null 对象为异常，不仅仅是实现了 `Exception` 或者` Error` 的对象。
  //throw '这也是一个异常';
  //throw new Exception('这是一个异常');
  //throw 666;

  //2.与Java不同之处在于捕获异常部分，Dart中捕获异常同样是使用`catch`语句，
  // 但是Dart中的`catch`无法指定异常类型。需要结合`on`来使用，基本语法如下：
  try {
    throw "AAA";
  } on String catch(e){
    //使用 on 指定捕获int类型的异常对象
    print("e= $e");
  } catch(except,stackTrace){
    //函数 catch() 可以带有一个或者两个参数， 第一个参数为抛出的异常对象， 第二个为堆栈信息 ( StackTrace 对象)
    print("except= $except stackTrace= $stackTrace");
    rethrow; //使用 `rethrow` 关键字可以 把捕获的异常给 重新抛出
  } finally{

  }
}