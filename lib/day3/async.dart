import 'dart:io';

///async 表示这是一个异步方法,await必须在async方法中使用
///异步方法只能返回 void和Future
void main(){
  Future<String> future= readFile();
  future.then((value) {
    print(value);
  }).catchError((e,s){
    print(e);
  });

/*  readFile2((s){
    print("s=$s");
  });*/
}



///方法只能返回 void和Future
Future<String> readFile() async{
  //await 等待future执行完成再执行后续代码
  String content=await File(r"F:\as2\flutter_study\lib\day3\ttt.txt").readAsString();
  String content2=await File(r"F:\as2\flutter_study\lib\day3\yyy.txt").readAsString();
  //String自动转换为 Future<String>
  return "$content\n\n$content2";
}

//readFile相当于我们的下面的方法
void readFile2(void callBack(s)){
   String result="";
   Future<String> future= File(r"F:\as2\flutter_study\lib\day3\ttt.txt").readAsString().then((value) {
    result+=value+"\n";
    return  File(r"F:\as2\flutter_study\lib\day3\yyy.txt").readAsString();
   });
   future.then((value){
     result+=value+"\n";
   }).whenComplete((){
     print(result);
     callBack(result);
   });

}
