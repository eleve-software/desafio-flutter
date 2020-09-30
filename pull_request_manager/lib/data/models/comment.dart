import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(nullable: false)
class UserComment {
  @JsonKey(name: 'login')
  final String login;

  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  UserComment({
    this.login,
    this.avatarUrl,
  });

  factory UserComment.fromJson(Map<String, dynamic> json) =>
      _$UserCommentFromJson(json);

  Map<String, dynamic> toJson() => _$UserCommentToJson(this);
}

@JsonSerializable(nullable: false)
class Comment {
  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'user')
  final UserComment user;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'body')
  final String body;

  Comment({
    this.url,
    this.user,
    this.createdAt,
    this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
