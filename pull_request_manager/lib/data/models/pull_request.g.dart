// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PullRequest _$PullRequestFromJson(Map<String, dynamic> json) {
  return PullRequest(
    issueUrl: json['issue_url'] as String,
    number: json['number'] as int,
    state: json['state'] as String,
    title: json['title'] as String,
    user: json['user.login'] as String,
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
      'user.login': instance.user,
      'body': instance.body,
      'created_at': instance.createdAt.toIso8601String(),
    };
