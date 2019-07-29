// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    config: json['config'] == null
        ? null
        : ConfigModel.fromJson(json['config'] as Map<String, dynamic>),
    bannerList: (json['bannerList'] as List)
        ?.map((e) =>
            e == null ? null : BannerModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    localNavList: (json['localNavList'] as List)
        ?.map((e) =>
            e == null ? null : CommonModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gridNav: json['gridNav'] == null
        ? null
        : GridNavModel.fromJson(json['gridNav'] as Map<String, dynamic>),
    subNavList: (json['subNavList'] as List)
        ?.map((e) =>
            e == null ? null : CommonModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    salesBox: json['salesBox'] == null
        ? null
        : SalesBoxModel.fromJson(json['salesBox'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'config': instance.config,
      'bannerList': instance.bannerList,
      'localNavList': instance.localNavList,
      'gridNav': instance.gridNav,
      'subNavList': instance.subNavList,
      'salesBox': instance.salesBox,
    };
