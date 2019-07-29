import 'package:flutter_trip/model/common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'salesbox_model.g.dart';

//icon | String	| NonNull
//moreUrl | String	|	NonNull
//bigCard1 | Object	|	NonNull
//bigCard2 | Object	|	NonNull
//smallCard1 | Object	|	NonNull
//smallCard2 | Object	|	NonNull
//smallCard3 | Object	|	NonNull
//smallCard4 | Object	|	NonNull
@JsonSerializable()
class SalesBoxModel {
  final String icon;
  final String moreUrl;
  final CommonModel bigCard1;
  final CommonModel bigCard2;
  final CommonModel smallCard1;
  final CommonModel smallCard2;
  final CommonModel smallCard3;
  final CommonModel smallCard4;

  SalesBoxModel(
      {this.icon,
      this.moreUrl,
      this.bigCard1,
      this.bigCard2,
      this.smallCard1,
      this.smallCard2,
      this.smallCard3,
      this.smallCard4});

  factory SalesBoxModel.fromJson(Map<String, dynamic> json) => _$SalesBoxModelFromJson(json);
  Map<String,dynamic> toJson() => _$SalesBoxModelToJson(this);
}
