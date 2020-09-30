// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPR _$UserPRFromJson(Map<String, dynamic> json) {
  return UserPR(
    login: json['login'] as String,
  );
}

Map<String, dynamic> _$UserPRToJson(UserPR instance) => <String, dynamic>{
      'login': instance.login,
    };

PullRequest _$PullRequestFromJson(Map<String, dynamic> json) {
  return PullRequest(
    issueUrl: json['issue_url'] as String,
    number: json['number'] as int,
    state: json['state'] as String,
    title: json['title'] as String,
    user: UserPR.fromJson(json['user'] as Map<String, dynamic>),
    body: json['body'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
  );
}

Map<String, dynamic> _$PullRequestToJson(PullRequest instance) =>
    <String, dynamic>{
      'issue_url': instance.issueUrl,
      'number': instance.number,
      'state': instance.state,
      'title': instance.title,
      'user': instance.user,
      'body': instance.body,
      'created_at': instance.createdAt.toIso8601String(),
    };
