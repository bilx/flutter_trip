import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget contentWidget;

  LoadingWidget({key, this.isLoading, this.contentWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading ? loadingView : contentWidget;
  }

  //显示load的视图，圆形加载
  Widget get loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
