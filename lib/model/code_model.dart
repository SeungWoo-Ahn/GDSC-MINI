import 'package:json_annotation/json_annotation.dart';

part 'code_model.g.dart';

@JsonSerializable()
class CodeModel {
  CodeModel({
    required this.phoneNumber,
    required this.code,
  });

  String phoneNumber;
  String code;

  factory CodeModel.fromJson(Map<String, dynamic> json) =>
      _$CodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CodeModelToJson(this);
}
