// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserComment _$UserCommentFromJson(Map<String, dynamic> json) {
  return UserComment(
    login: json['login'] as String,
    avatarUrl: json['avatar_url'] as String,
  );
}

Map<String, dynamic> _$UserCommentToJson(UserComment instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    url: json['url'] as String,
    user: UserComment.fromJson(json['user'] as Map<String, dynamic>),
    createdAt: DateTime.parse(json['created_at'] as String),
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'url': instance.url,
      'user': instance.user,
      'created_at': instance.createdAt.toIso8601String(),
      'body': instance.body,
    };
