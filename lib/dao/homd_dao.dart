import 'package:flutter_trip/dao/net_url.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:stack_trace/stack_trace.dart';

import 'package:dio/dio.dart' as dioHttp;

class HomeDao {
  //获取首页数据 ，异步请求
  static Future<HomeModel> fatch() {
   return Chain.capture(() async {
      try {
        dioHttp.Response response = await dioHttp.Dio().get(HOME_URL);
        print(response.data.toString());
        return HomeModel.fromJson(response.data);
      } catch (e) {
        throw e;
      }
    });
  }
}
