import 'package:gdsc_mini_project/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_response.g.dart';

@JsonSerializable()
class GetUserResponse {
  GetUserResponse({required this.userModel});
  final UserModel? userModel;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}
