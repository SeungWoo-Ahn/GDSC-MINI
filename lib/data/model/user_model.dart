import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? email;
  String? username;
  String? phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? termsAcceptedAt;

  UserModel(
      {this.id,
      this.email,
      this.username,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.termsAcceptedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
