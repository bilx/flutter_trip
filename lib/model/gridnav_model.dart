//hotel | Object	| NonNull
//flight | Object	|	NonNull
//travel | Object	|	NonNull
import 'package:flutter_trip/model/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gridnav_model.g.dart';

@JsonSerializable()
class GridNavModel {
  final GridNavItem hotel; //
  final GridNavItem flight;
  final GridNavItem travel;

  GridNavModel({this.hotel, this.flight, this.travel});

  factory GridNavModel.fromJson(Map<String, dynamic> json) =>
      _$GridNavModelFromJson(json);

  Map<String, dynamic> toJson() => _$GridNavModelToJson(this);
}

//    "startColor": String,
//      "endColor": String,
//      "mainItem": CommonModel
//      "item1":  CommonModel
//      "item2": CommonModel
//      "item3":CommonModel
//      "item4": CommonModel
@JsonSerializable()
class GridNavItem {
  final String startColor;

  final String endColor;

  final CommonModel mainItem;

  final CommonModel item1;

  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem(
      {this.startColor,
      this.endColor,
      this.mainItem,
      this.item1,
      this.item2,
      this.item3,
      this.item4});

  factory GridNavItem.fromJson(Map<String, dynamic> json) =>
      _$GridNavItemFromJson(json);

  Map<String, dynamic> toJson() => _$GridNavItemToJson(this);
}
