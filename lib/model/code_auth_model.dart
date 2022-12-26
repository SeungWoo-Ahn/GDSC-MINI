import 'package:json_annotation/json_annotation.dart';

part 'code_auth_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CodeAuthModel {
  final String phoneNum;
  final String code;

  CodeAuthModel({
    required this.phoneNum,
    required this.code,
  });

  factory CodeAuthModel.fromJson(Map<String, dynamic> json) =>
      _$CodeAuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$CodeAuthModelToJson(this);
}
