// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonModel _$CommonModelFromJson(Map<String, dynamic> json) {
  return CommonModel(
    icon: json['icon'] as String,
    title: json['title'] as String,
    url: json['url'] as String,
    statusBarColor: json['statusBarColor'] as String,
    hideAppBar: json['hideAppBar'] as bool,
  );
}

Map<String, dynamic> _$CommonModelToJson(CommonModel instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
      'statusBarColor': instance.statusBarColor,
      'hideAppBar': instance.hideAppBar,
    };
