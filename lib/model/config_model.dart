import 'package:json_annotation/json_annotation.dart';

//json 序列化出辅助类的文件名
part 'config_model.g.dart';

@JsonSerializable()
class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  factory ConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigModelToJson(this);
}
