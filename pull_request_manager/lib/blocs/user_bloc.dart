import 'dart:async';

import '../data/models/user.dart';
import '../data/repositories/user_repository.dart';
import 'bloc.dart';

class UserBloc implements Bloc {
  final UserRepository _userRepository;
  final _controller = StreamController<User>();

  UserBloc(this._userRepository);

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
