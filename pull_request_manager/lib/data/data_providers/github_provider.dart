import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../setup_locator.dart';
import '../../shared/contants.dart';
import '../models/pull_request.dart';
import '../models/repository.dart';
import '../models/user.dart';

class GitHubProvider {
  final _client = getIt.get<http.Client>();

  Future<User> getUser(String username) async {
    try {
      final url = '$baseUrl/users/$username';
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        return User.fromJson(parsed);
      } else {
        throw ('Usuário não encontrado.');
      }
    } catch (error) {
      throw ('Ocorreu um erro.');
    }
  }

  Future<List<Repository>> getRepositories(String username) async {
    final url = '$baseUrl/users/$username/repos';
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
      throw ('Ocorreu um erro.');
    }
  }

  Future<List<PullRequest>> getPullRequests(
      String username, String repository) async {
    final url = '$baseUrl/repos/$username/$repository/pulls';
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        return parsed
            .map<PullRequest>((json) => PullRequest.fromJson(json))
            .toList();
      } else {
        throw ('Esse repositório ainda não tem nenhum pull request.');
      }
    } catch (error) {
      throw ('Ocorreu um erro.');
    }
  }
}
