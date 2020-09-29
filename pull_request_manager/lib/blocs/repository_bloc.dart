import 'dart:async';

import '../data/models/repository.dart';
import '../data/repositories/repository_repository.dart';
import '../setup_locator.dart';
import 'bloc.dart';

class RepositoryBloc implements Bloc {
  final _repositoryRepository = getIt.get<RepositoryRepository>();
  final _controller = StreamController<List<Repository>>();

  Stream<List<Repository>> get stream => _controller.stream;

  void fetchRepositories(String username) async {
    final repositories = await _repositoryRepository.getRepositories(username);
    _controller.sink.add(repositories);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
