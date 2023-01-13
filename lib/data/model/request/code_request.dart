import 'package:json_annotation/json_annotation.dart';

part 'code_request.g.dart';

@JsonSerializable()
class CodeRequest {
  CodeRequest({required this.phone, required this.code});
  String phone;
  String code;

  factory CodeRequest.fromJson(Map<String, dynamic> json) =>
      _$CodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CodeRequestToJson(this);
}
