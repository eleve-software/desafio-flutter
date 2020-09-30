import '../../setup_locator.dart';
import '../data_providers/github_provider.dart';
import '../models/pull_request.dart';

class PullRequestRepository {
  final _githubProvider = getIt.get<GitHubProvider>();

  Future<List<PullRequest>> getPullRequests(
      String username, String repository) async {
    return await _githubProvider.getPullRequests(username, repository);
  }
}
