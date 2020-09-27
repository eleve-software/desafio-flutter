import '../data_providers/github_provider.dart';
import '../models/user.dart';

class UserRepository {
  final GitHubProvider _githubProvider;

  UserRepository(this._githubProvider);

  Future<User> getUser(String username) async {
    return await _githubProvider.getUser(username);
  }
}
