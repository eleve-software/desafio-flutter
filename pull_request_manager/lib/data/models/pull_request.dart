import 'package:json_annotation/json_annotation.dart';

part 'pull_request.g.dart';

@JsonSerializable(nullable: false)
class PullRequest {
  @JsonKey(name: 'issue_url')
  final String issueUrl;

  @JsonKey(name: 'number')
  final int number;

  @JsonKey(name: 'state')
  final String state;

  @JsonKey(name: 'title')
  final String title;

  // Fix usuário null
  @JsonKey(name: 'user.login')
  final String user;

  @JsonKey(name: 'body')
  final String body;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  PullRequest({
    this.issueUrl,
    this.number,
    this.state,
    this.title,
    this.user,
    this.body,
    this.createdAt,
  });

  factory PullRequest.fromJson(Map<String, dynamic> json) =>
      _$PullRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PullRequestToJson(this);
}
