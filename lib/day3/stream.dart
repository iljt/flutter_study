import 'dart:io';

void main(){
  //new File(r"C:\Users\W10\AndroidStudioProjects\flutter_app\lib\3、异步编程\ttt.txt").readAsBytes().then((value) => print(value));


  //复制一个文件yyy.txt命名为yyy_copy.txt
  var dstfile=File(r"F:\as2\flutter_study\lib\day3\yyy_copy.txt");
  // ignore: close_sinks
  var write=dstfile.openWrite();

  // Stream<List<int>>xiang当于Java里面的byte[]
  //读取文件并拿到文件内容  每次从文件读取byte[]数组个字节内容到内存,性能比使用readAsString()一次性读到内存好。
  Stream<List<int>> stream= File(r"F:\as2\flutter_study\lib\day3\yyy.txt").openRead();
  // ignore: cancel_subscriptions
  var listen= stream.listen((event) {
    print(event);
    write.add(event);
  });
  //替代掉listen的方法 不会执行上面的打印语句print(event);
/*  listen.onData((s){
    print("strema2");
  });
  listen.onDone((){
    print("读完整个文件");
  });*/
//  listen.pause();
//  listen.resume();


}

