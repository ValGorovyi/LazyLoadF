// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postsApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posts _$PostsFromJson(Map<String, dynamic> json) => Posts(
  body: json['body'] as String,
  title: json['title'] as String,
  id: (json['id'] as num).toInt(),
  userID: (json['userId'] as num).toInt(),
);

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
  'title': instance.title,
  'body': instance.body,
  'id': instance.id,
  'userId': instance.userID,
};
