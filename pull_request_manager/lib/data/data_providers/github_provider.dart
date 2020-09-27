import 'package:dio/dio.dart';

import '../models/user.dart';

class GitHubProvider {
  final Dio _client;

  GitHubProvider(this._client);

  Future<User> getUser(String username) async {
    try {
      final response = await _client.get('/users/$username');
      if (response.statusCode == 200) {
        final user = response.data;
        return User.fromJson(user);
      } else {
        throw ('Usuário não encotrado.');
      }
    } catch (error) {
      throw ('Ocorreu um erro.');
    }
  }
}
