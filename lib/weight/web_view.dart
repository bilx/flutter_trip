import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';

const CATCH_URLS = ["m.ctrip.com/", "m.ctrip.com/html5/", "m.ctrip.com/html5"];

class WebView extends StatefulWidget {
  final String url; //加载的url
  final String statusBarColor; //状态栏颜色
  final String title; //标题
  final bool hidAppBar; //是否隐藏状态栏
  final bool backForbid; //是否禁止返回键

  WebView(
      {this.url,
      this.statusBarColor,
      this.title,
      this.hidAppBar,
      this.backForbid = false});

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  //webview 插件对象
  final webviewReference = FlutterWebviewPlugin();

  //webview url 变更监听
  StreamSubscription<String> _onUrlChangedListener;

  //webview 状态变更监听
  StreamSubscription<WebViewStateChanged> _onStateChangedListener;
  StreamSubscription<WebViewHttpError> _onErrorListener;

  //是否已经返回
  bool exiting = false;

  @override
  void initState() {
    super.initState();
    //先关闭防止重复打开
    webviewReference.close();
    //绑定事件监听
    bindListener();
  }

  //绑定webview 事件监听
  bindListener() {
    //设置url更新监听
    _onUrlChangedListener = webviewReference.onUrlChanged.listen((event) {});

    //设置webview状态监听
    _onStateChangedListener = webviewReference.onStateChanged.listen((state) {
      switch (state.type) {
        case WebViewState.shouldStart:
          print("webview shouldStart");
          break;
        case WebViewState.startLoad:
          print("webview startLoad");
          if (_isToMain(state.url) && !exiting) {
            if (widget.backForbid) {
              webviewReference.launch(widget.url);
            } else {
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        case WebViewState.finishLoad:
          print("webview finishLoad");
          break;
        case WebViewState.abortLoad:
          print("webview abortLoad");
          break;
      }
    });

    //监听webview 加载错误监听
    _onErrorListener = webviewReference.onHttpError.listen((event) {
      print(event);
    });
  }

  _isToMain(String url) {
    bool contain = false;

    for (final t in CATCH_URLS) {
      if (url?.endsWith(t) ?? false) {
        contain = true;
        break;
      }
    }

    return contain;
  }

  @override
  void dispose() {
    webviewReference.dispose(); //销毁webview
    //关闭监听
    _onUrlChangedListener?.cancel();
    _onStateChangedListener?.cancel();
    _onErrorListener?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String backGroundColor = widget.statusBarColor ?? "ffffff";

    Color backButtonColor;
    if (widget.statusBarColor == "ffffff") {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          _generateAppBar(
            Color(int.parse("0xff$backGroundColor")),
            backButtonColor,
          ),
          //webview
          Expanded(
              child: WebviewScaffold(
            url: widget.url,
            //缩放开启
            withZoom: true,
            //本地存储开启
            withLocalStorage: true,
            //隐藏默认加载
            hidden: true,
            //自定义加载时显示的组件
            initialChild: Container(
              color: Colors.white,
              child: Center(
                child: Text("Loadding ... "),
              ),
            ),
          ))
        ],
      ),
    );
  }

  ///
  /// 生成appbar函数
  /// backgroundColor : appbar 背景色
  /// backButtonColor : 返回按钮颜色
  ///
  _generateAppBar(Color backgroundColor, Color backButtonColor) {
    //是否隐藏状态栏
    if (widget.hidAppBar ?? false) {
      //隐藏状态栏的情况 只展示一个颜色背景
      return Container(
        color: backgroundColor,
        height: 30,
      );
    }

    //不隐藏的情况
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.only(top: 40, bottom: 10),
      //宽度铺满屏幕
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            //返回按钮
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                  size: 26,
                ),
              ),
            ),

            //标题 居中
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  widget.title ?? "",
                  style: TextStyle(color: backButtonColor, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
