// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequest _$PostRequestFromJson(Map<String, dynamic> json) => PostRequest(
      user_id: json['user_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PostRequestToJson(PostRequest instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'title': instance.title,
      'description': instance.description,
    };
