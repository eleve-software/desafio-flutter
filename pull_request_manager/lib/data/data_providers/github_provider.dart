import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../setup_locator.dart';
import '../../shared/contants.dart';
import '../models/repository.dart';
import '../models/user.dart';

class GitHubProvider {
  final _client = getIt.get<http.Client>();

  Future<User> getUser(String username) async {
    try {
      final url = baseUrl + username;
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return User.fromJson(parsed);
      } else {
        throw ('Usuário não encotrado.');
      }
    } catch (error) {
      throw ('Ocorreu um erro.');
    }
  }

  Future<List<Repository>> getRepositories(String username) async {
    final url = baseUrl + username + '/repos';
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        return parsed
            .map<Repository>((json) => Repository.fromJson(json))
            .toList();
      } else {
        throw ('O usuário não tem nenhum repositório.');
      }
    } catch (error) {
      print(error.toString());
      throw ('Ocorreu um erro.');
    }
  }
}
