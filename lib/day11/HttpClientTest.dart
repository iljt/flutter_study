import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';


class HttpClientTest extends StatefulWidget{
  const HttpClientTest({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HttpClientState();
  }
}

class _HttpClientState extends State<HttpClientTest>{
  bool _loading = false;
  String _text = "";

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text("HttpClient求网络请"),
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: _loading ? null : request,
                child: Text("获取百度首页"),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_text.replaceAll(RegExp(r"\s"), "")),
              )
            ],
          ),
        )
    );
  }

  request() async {
    setState(() {
      _loading = true;
      _text = "正在请求...";
    });
    try {
      //创建一个HttpClient
      HttpClient httpClient = HttpClient();
      //打开Http连接
      HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      //HTTP请求认证
    /* Http协议的认证（Authentication）机制可以用于保护非公开资源。如果Http服务器开启了认证，那么用户在发起请求时就需要携带用户凭据，如果你在浏览器中访问了启用Basic认证的资源时，浏览就会弹出一个登录框
      Basic认证的基本过程：
      客户端发送http请求给服务器，服务器验证该用户是否已经登录验证过了，如果没有的话，  服务器会返回一个401 Unauthozied给客户端，并且在响应header中添加一个 “WWW-Authenticate” 字段，例如：
      WWW-Authenticate: Basic realm="admin"
      其中"Basic"为认证方式，realm为用户角色的分组，可以在后台添加分组。
      客户端得到响应码后，将用户名和密码进行base64编码（格式为用户名:密码），设置请求头Authorization，继续访问 :
      Authorization: Basic YXXFISDJFISJFGIJIJG
      服务器验证用户凭据，如果通过就返回资源内容。*/
    /*  httpClient.authenticate=(Uri url, String scheme, String realm) async{
        if(url.host=="xx.com" && realm=="admin"){
          httpClient.addCredentials(url,
            "admin",
            HttpClientBasicCredentials("username","pwd"),
          );
          return true;
        }
        return false;
      } as Future<bool> Function(Uri url, String scheme, String? realm)?;*/
      ///代理 可以通过findProxy来设置代理策略，例如，我们要将所有请求通过代理服务器（192.168.1.2:8888）发送出去
    /*  httpClient.findProxy = (uri) {
        // 如果需要过滤uri，可以手动判断
        //findProxy 回调返回值是一个遵循浏览器PAC脚本格式的字符串，如果不需要代理，返回"DIRECT"即可
         return "PROXY 192.168.1.2:8888";
       };*/
      ///证书校验
/*      Https中为了防止通过伪造证书而发起的中间人攻击，客户端应该对自签名或非CA颁发的证书进行校验。HttpClient对证书校验的逻辑如下：
      如果请求的Https证书是可信CA颁发的，并且访问host包含在证书的domain列表中(或者符合通配规则)并且证书未过期，则验证通过。
      如果第一步验证失败，但在创建HttpClient时，已经通过 SecurityContext 将证书添加到证书信任链中，那么当服务器返回的证书在信任链中的话，则验证通过。
      如果1、2验证都失败了，如果用户提供了badCertificateCallback回调，则会调用它，如果回调返回true，则允许继续链接，如果返回false，则终止链接。
      综上所述，我们的证书校验其实就是提供一个badCertificateCallback回调*/
      ///假设我们的后台服务使用的是自签名证书，证书格式是PEM格式，我们将证书的内容保存在本地字符串中，那么我们的校验逻辑如下
     /// X509Certificate是证书的标准格式，包含了证书除私钥外所有信息，读者可以自行查阅文档。另外，上面的示例没有校验host，是因为只要服务器返回的证书内容和本地的保存一致就已经能证明是我们的服务器了（而不是中间人），host 验证通常是为了防止证书和域名不匹配。
     /// 对于自签名的证书，我们也可以将其添加到本地证书信任链中，这样证书验证时就会自动通过，而不会再走到badCertificateCallback回调中
     /* String PEM="XXXXX";//可以从文件读取
      httpClient.badCertificateCallback=(X509Certificate cert, String host, int port){
      if(cert.pem==PEM){
        return true; //证书一致，则允许发送数据
      }
        return false;
      };*/
      //使用iPhone的UA
      request.headers.add(
        "user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1",
      );
      //等待连接服务器（会将请求信息发送给服务器）
      HttpClientResponse response = await request.close();
      //读取响应内容
      _text = await response.transform(utf8.decoder).join();
      //输出响应头
      print(response.headers);

      //关闭client后，通过该client发起的所有请求都会终止。
      httpClient.close();
    } catch (e) {
      _text = "请求失败：$e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}