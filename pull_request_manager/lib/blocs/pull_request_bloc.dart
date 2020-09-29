import 'dart:async';

import '../data/models/pull_request.dart';
import '../data/repositories/pull_request_repository.dart';
import '../setup_locator.dart';
import 'bloc.dart';

class PullRequestBloc implements Bloc {
  final _repositoryRepository = getIt.get<PullRequestRepository>();
  final _controller = StreamController<List<PullRequest>>();

  Stream<List<PullRequest>> get stream => _controller.stream;

  void fetchRepositories(String username, String repository) async {
    final repositories =
        await _repositoryRepository.getPullRequests(username, repository);
    _controller.sink.add(repositories);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
