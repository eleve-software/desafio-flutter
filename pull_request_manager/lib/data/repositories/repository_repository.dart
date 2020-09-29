import '../../setup_locator.dart';
import '../data_providers/github_provider.dart';
import '../models/repository.dart';

class RepositoryRepository {
  final _githubProvider = getIt.get<GitHubProvider>();

  Future<List<Repository>> getRepositories(String username) async {
    return await _githubProvider.getRepositories(username);
  }
}
