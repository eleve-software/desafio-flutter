import 'dart:async';

import '../data/models/user.dart';
import '../data/repositories/user_repository.dart';
import '../setup_locator.dart';
import 'bloc.dart';

class UserBloc implements Bloc {
  final _userRepository = getIt.get<UserRepository>();
  final _controller = StreamController<User>();

  Stream<User> get stream => _controller.stream;

  void searchUser(String username) async {
    final user = await _userRepository.getUser(username);
    _controller.sink.add(user);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
