import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable(nullable: false)
class Repository {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'stargazers_count')
  final int stargazersCount;

  @JsonKey(name: 'forks_count')
  final int forksCount;

  @JsonKey(name: 'open_issues_count')
  final int openIssuesCount;

  Repository({
    this.name,
    this.description,
    this.stargazersCount,
    this.forksCount,
    this.openIssuesCount,
  });

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}
