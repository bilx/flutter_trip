// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gridnav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridNavModel _$GridNavModelFromJson(Map<String, dynamic> json) {
  return GridNavModel(
    hotel: json['hotel'] == null
        ? null
        : GridNavItem.fromJson(json['hotel'] as Map<String, dynamic>),
    flight: json['flight'] == null
        ? null
        : GridNavItem.fromJson(json['flight'] as Map<String, dynamic>),
    travel: json['travel'] == null
        ? null
        : GridNavItem.fromJson(json['travel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GridNavModelToJson(GridNavModel instance) =>
    <String, dynamic>{
      'hotel': instance.hotel,
      'flight': instance.flight,
      'travel': instance.travel,
    };

GridNavItem _$GridNavItemFromJson(Map<String, dynamic> json) {
  return GridNavItem(
    startColor: json['startColor'] as String,
    endColor: json['endColor'] as String,
    mainItem: json['mainItem'] == null
        ? null
        : CommonModel.fromJson(json['mainItem'] as Map<String, dynamic>),
    item1: json['item1'] == null
        ? null
        : CommonModel.fromJson(json['item1'] as Map<String, dynamic>),
    item2: json['item2'] == null
        ? null
        : CommonModel.fromJson(json['item2'] as Map<String, dynamic>),
    item3: json['item3'] == null
        ? null
        : CommonModel.fromJson(json['item3'] as Map<String, dynamic>),
    item4: json['item4'] == null
        ? null
        : CommonModel.fromJson(json['item4'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GridNavItemToJson(GridNavItem instance) =>
    <String, dynamic>{
      'startColor': instance.startColor,
      'endColor': instance.endColor,
      'mainItem': instance.mainItem,
      'item1': instance.item1,
      'item2': instance.item2,
      'item3': instance.item3,
      'item4': instance.item4,
    };
