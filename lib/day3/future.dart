import 'dart:io';

void main(){
  //延时6s执行
  //new Duration(minutes: 0,seconds: 3) 可选命名参数传入相应参数
  Future future=Future.delayed(const Duration(days:0,hours:0,minutes: 0,seconds:6));
  // future的执行结果 通过then可以获取
  future.then((value) => print(value));

  //读取文件并拿到文件内容 一次性从读取文件内容到内存 性能没有使用stream好
  ////提供一个 `r` 前缀可以创建一个 “原始 raw” 字符串 而不需要转义  转义写法"C:\\Users\\W10\\AndroidStudioProjects\\flutter_app\\lib\\3、异步编程\\UCORE应用信息.txt"
 Future<String>  futureStr=File(r"F:\as2\flutter_study\lib\day3\yyy.txt").readAsString();
  futureStr.then((value) {
    print(value);
  }).catchError((e,s){
    //异常对象信息
    print("e=$e");
    //第二个为堆栈信息 ( StackTrace 对象)
    print("s=$s");
  });



}