import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: false)
class User {
  @JsonKey(name: 'login')
  final String login;

  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @JsonKey(name: 'repos_url')
  final String reposUrl;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'bio')
  final String bio;

  @JsonKey(name: 'public_repos')
  final int publicRepos;

  User({
    this.login,
    this.avatarUrl,
    this.reposUrl,
    this.name,
    this.bio,
    this.publicRepos,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
