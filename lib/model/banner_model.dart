import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  final String icon;
  final String url;

  BannerModel({this.icon, this.url});


  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);


  Map<String, dynamic> toJson() => _$BannerModelToJson(this);

}