import 'package:json_annotation/json_annotation.dart';

part 'postsApi.g.dart';

@JsonSerializable()
class Posts {
  final String title;
  final String body;
  final int id;
  @JsonKey(name: 'userId')
  final int userID;
  Posts({
    required this.body,
    required this.title,
    required this.id,
    required this.userID,
  });
  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
  Map<String, dynamic> toJson() => _$PostsToJson(this);
}
