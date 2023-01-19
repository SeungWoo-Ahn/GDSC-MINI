import 'package:json_annotation/json_annotation.dart';

import '../user_model.dart';

part 'get_user_response.g.dart';

@JsonSerializable()
class GetUserResponse {
  GetUserResponse({required this.userModel});
  final UserModel? userModel;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}
