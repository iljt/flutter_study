import 'dart:io';

void main(){
  // then：可以得到Future的结果并且能够返回一个新的Future
/* Future<String> then = new File(r"F:\as2\flutter_study\lib\day3\ttt.txt").readAsString()
      .then((String s) {
    //返回void 或者Future
    print(s);
    return "wewwrewrewre"; //11111被转化为 Future<int>类型 返回
   // return "获取文件内容成功。。。。。。。。。。";
  }).catchError((e,s){
    print("e=$e");
    print("s=$s");
  }) ;
  //通过then可以完成 有序任务的执行，一个任务执行完成之后，下一个任务根据上个任务的结果 执行不同的操作
  then.then((String i) {
    print(i);
  });*/

  //如果需要一组任务都执行完毕之后 再统一执行相同的一些处理
  //读取文件和延迟3s都执行完之后在打印结果
 /* Future.wait([File(r"F:\as2\flutter_study\lib\day3\ttt.txt").readAsString(),Future.delayed(const Duration(seconds: 3))]).then((value) {
    print("value= $value");
  });*/

 /* Future readDone = File(r"F:\as2\flutter_study\lib\day3\ttt.txt").readAsString();
  //延迟3s
  Future delayedDone = Future.delayed(Duration(seconds: 3));

  Future.wait([readDone, delayedDone]).then((values) {
    print(values[0]);//第一个future的结果
    print(values[1]);//第二个future的结果
  });
  
  //发射多个事件
  Future.forEach([1,2,3,4,5], (element) => print(element));*/
}
