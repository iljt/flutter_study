
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

class FileOperationTest extends StatefulWidget{
  const FileOperationTest({super.key, required this.text});
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _FileOperationState();
  }

}

class _FileOperationState extends State<FileOperationTest>{
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //从文件读取点击次数
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }

/*  APP目录
  Android 和 iOS 的应用存储目录不同，PathProvider (opens new window)插件提供了一种平台透明的方式来访问设备文件系统上的常用位置。该类当前支持访问两个文件系统位置：
  临时目录: 可以使用 getTemporaryDirectory() 来获取临时目录； 系统可随时清除临时目录的文件。在 iOS 上，这对应于NSTemporaryDirectory() (opens new window)返回的值。在 Android上，这是getCacheDir() (opens new window)返回的值。
  文档目录: 可以使用getApplicationDocumentsDirectory()来获取应用程序的文档目录，该目录用于存储只有自己可以访问的文件。只有当应用程序被卸载时，系统才会清除该目录。在 iOS 上，这对应于NSDocumentDirectory。在 Android 上，这是AppData目录。
  外部存储目录：可以使用getExternalStorageDirectory()来获取外部存储目录，如 SD 卡；由于 iOS不支持外部目录，所以在 iOS 下调用该方法会抛出UnsupportedError异常，而在 Android 下结果是Android SDK 中getExternalStorageDirectory的返回值。*/
  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        appBar: AppBar(title: const Text('文件操作')),
        body: Center(
          child: Text('点击了 $_counter 次'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
  }

}
