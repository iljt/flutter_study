
import 'dart:io';
import 'dart:isolate';
int i=0;

void main(){
 i = 10;
 print(i);
  // 主isolate创建一个消息接收器
 var receivePort =ReceivePort();
 //将消息接收器当中的发送器 发给 子 isolate
 Isolate.spawn(entryPoint, receivePort.sendPort);
 receivePort.listen((message) {
  //接收到了 子isolate 的 发送器
  if (message is SendPort) {
   print("接收到其他isolate发过来的SendPort消息！$message");
   message.send("666");
  } else{
   print("接收到其他isolate发过来的其他消息！$message");
  }
 });
 //休眠5s后发送
  sleep(const Duration(seconds: 5));
  receivePort.sendPort.send("111");
 // receivePort.sendPort.send("2222");
 // receivePort.sendPort.send(333);
  //close关闭后接收不到其他islate发过来的消息
  //receivePort.close();

 //receivePort.close();

}

// 子isolate
void entryPoint(SendPort sendPort){
 i =100;
 print(i);
 // 子isolate创建一个消息接收器
 var receivePort =ReceivePort();
 //将该消息接收器当中的发送器 发给 主 isolate
 sendPort.send(receivePort.sendPort);
 sendPort.send(i);
 receivePort.listen((message) {
    print("接收到主isolate发过来的消息！$message");
 });
 //sendPort.send("1");
}