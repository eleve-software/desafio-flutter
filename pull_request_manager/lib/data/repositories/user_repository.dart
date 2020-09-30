import '../../setup_locator.dart';
import '../data_providers/github_provider.dart';
import '../models/user.dart';

class UserRepository {
  final _githubProvider = getIt.get<GitHubProvider>();

  Future<User> getUser(String username) async {
    return await _githubProvider.getUser(username);
  }
}
