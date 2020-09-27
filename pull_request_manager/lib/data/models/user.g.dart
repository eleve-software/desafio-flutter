// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    login: json['login'] as String,
    avatarUrl: json['avatar_url'] as String,
    reposUrl: json['repos_url'] as String,
    name: json['name'] as String,
    bio: json['bio'] as String,
    publicRepos: json['public_repos'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'repos_url': instance.reposUrl,
      'name': instance.name,
      'bio': instance.bio,
      'public_repos': instance.publicRepos,
    };
