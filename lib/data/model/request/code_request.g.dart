// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeRequest _$CodeRequestFromJson(Map<String, dynamic> json) => CodeRequest(
      phoneNumber: json['phoneNumber'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CodeRequestToJson(CodeRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'code': instance.code,
    };
