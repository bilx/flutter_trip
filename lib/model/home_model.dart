//首页收据实体类模型
//
//config | Object	| NonNull
//bannerList | Array	|	NonNull
//localNavList | Array	|	NonNull
//gridNav | Object	|	NonNull
//subNavList | Array	|	NonNull
//salesBox | Object	|	NonNull
import 'package:flutter_trip/model/banner_model.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/config_model.dart';
import 'package:flutter_trip/model/gridnav_model.dart';
import 'package:flutter_trip/model/salesbox_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  final ConfigModel config;
  final List<BannerModel> bannerList; //头部的banner列表
  final List<CommonModel> localNavList; //
  final GridNavModel gridNav;
  final List<CommonModel> subNavList;

  final SalesBoxModel salesBox;

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
