import 'dart:async';

import '../data/models/comment.dart';
import '../data/repositories/comment_repository.dart';
import '../setup_locator.dart';
import 'bloc.dart';

class CommentBloc implements Bloc {
  final _commentRepository = getIt.get<CommentRepository>();
  final _controller = StreamController<List<Comment>>();

  Stream<List<Comment>> get stream => _controller.stream;

  void fetchComments(String issueUrl) async {
    final repositories = await _commentRepository.getComments(issueUrl);
    _controller.sink.add(repositories);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
