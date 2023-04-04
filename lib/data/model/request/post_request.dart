import 'package:json_annotation/json_annotation.dart';

part 'post_request.g.dart';

@JsonSerializable()
class PostRequest {
  PostRequest({
    required this.user_id,
    required this.title,
    required this.description,
  });

  int user_id;
  String title;
  String description;

  factory PostRequest.fromJson(Map<String, dynamic> json) =>
      _$PostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostRequestToJson(this);
}
