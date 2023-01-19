import 'package:json_annotation/json_annotation.dart';

part 'phone_request.g.dart';

@JsonSerializable()
class PhoneRequest {
  PhoneRequest({
    required this.phoneNumber,
  });
  String phoneNumber;

  factory PhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneRequestToJson(this);
}
