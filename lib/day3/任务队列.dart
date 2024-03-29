import 'dart:io';
import 'dart:isolate';
///	Dart在执行完main函数后，就会由Loop开始执行两个任务队列中的Event。
///首先Loop检查微服务队列，依次执行Event queue(事件队列)，当微服务队列执行完后，就检查Event queue队列依次执行，在执行Event queue的过程中，每执行完一个Event就再检查一次微服务队列。
///所以微服务队列优先级高，可以利用微服务进行插队。
void main(){
  var receivePort = new ReceivePort();

  receivePort.listen((t){
    print(t);
    //微任务在一个事件队列任务执行完后再次判断有没有微任务，如果有则执行微任务
    Future.microtask((){
      print("一个事件队列任务执行完后微任务插队执行");
    });
  });

  //发送消息到Event queue事件队列
  receivePort.sendPort.send("发送消息给消息接收器1!");

  //在微任务队列中提交一个任务
  Future.microtask((){
    print("微任务执行1");
  });


  receivePort.sendPort.send("发送消息给消息接收器2!");

  receivePort.sendPort.send("发送消息给消息接收器3!");

  Future.microtask((){
    print("微任务执行2");
  });

  Future.microtask((){
        print("微任务执行3");
  });
  sleep(Duration(seconds: 5));

  //微任务队列会不会插队？
  //执行结果为：执行完main函数后，即5s后，先执行微任务队列里面的任务，再执行事件队列的任务，如果在执行完一个事件任务后判断有没有微任务，如果有则执行微任务，然后再继续执行事件队列里的任务。
 /* 微任务执行1
  微任务执行2
  微任务执行3
  发送消息给消息接收器1!
  一个事件队列任务执行完后微任务插队执行
  发送消息给消息接收器2!
  一个事件队列任务执行完后微任务插队执行
  发送消息给消息接收器3!
  一个事件队列任务执行完后微任务插队执行*/
}