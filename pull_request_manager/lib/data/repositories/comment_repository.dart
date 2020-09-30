import '../../setup_locator.dart';
import '../data_providers/github_provider.dart';
import '../models/comment.dart';

class CommentRepository {
  final _githubProvider = getIt.get<GitHubProvider>();

  Future<List<Comment>> getComments(String issueUrl) async {
    return await _githubProvider.getComments(issueUrl);
  }
}
