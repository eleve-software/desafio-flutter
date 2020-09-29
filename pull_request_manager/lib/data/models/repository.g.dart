// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository(
    name: json['name'] as String,
    description: json['description'] as String,
    stargazersCount: json['stargazers_count'] as int,
    forksCount: json['forks_count'] as int,
    openIssuesCount: json['open_issues_count'] as int,
  );
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'stargazers_count': instance.stargazersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
    };
