
import 'dart:io';

void main(){
  Stream<List<int>> stream = File(r"F:\as2\flutter_study\lib\day3\yyy.txt").openRead();
  //两个订阅者会报错FileSystemException: An async operation is currently pending, path = 'F:\as2\flutter_study\lib\day3\yyy.txt'
  /* var listen = stream.listen((s){

  });
  stream.listen((s){

  });*/


  //广播模式  : 可以多订阅
  var broadcastStream = stream.asBroadcastStream();
  broadcastStream.listen((_){
    print("listen1");

  });
  broadcastStream.listen((_){
    print("listen2");
  });
//
//  broadcastStream.listen((_){});
//  broadcastStream.listen((_){});
//  broadcastStream.listen((_){});
}
