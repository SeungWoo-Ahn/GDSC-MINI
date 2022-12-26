import 'package:json_annotation/json_annotation.dart';

part 'phone_auth_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PhoneAuthModel {
  final String phoneNum;

  PhoneAuthModel({
    required this.phoneNum,
  });

  factory PhoneAuthModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneAuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneAuthModelToJson(this);
}
