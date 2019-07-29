import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/weight/web_view.dart';
import 'dart:convert';

// 封装 跳转到webview 的点击
Widget warpJumpWebView(BuildContext context, Widget widget, CommonModel model,
    {bool backForbid = false}) {
  return GestureDetector(
      onTap: () {
        print("warpJumpWebView ${json.encode(model)}");

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: model.url,
                      statusBarColor: model.statusBarColor,
                      title: model.title,
                      hidAppBar: model.hideAppBar,
                      backForbid: backForbid,
                    )));
      },
      child: widget);
}
