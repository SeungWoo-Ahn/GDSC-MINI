// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeAuthModel _$CodeAuthModelFromJson(Map<String, dynamic> json) =>
    CodeAuthModel(
      phoneNum: json['phone_num'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CodeAuthModelToJson(CodeAuthModel instance) =>
    <String, dynamic>{
      'phone_num': instance.phoneNum,
      'code': instance.code,
    };
