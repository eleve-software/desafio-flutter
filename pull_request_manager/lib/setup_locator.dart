import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'blocs/repository_bloc.dart';
import 'blocs/user_bloc.dart';
import 'data/data_providers/github_provider.dart';
import 'data/repositories/repository_repository.dart';
import 'data/repositories/user_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => GitHubProvider());
  getIt.registerFactory(() => UserRepository());
  getIt.registerFactory(() => RepositoryRepository());
  getIt.registerFactory(() => UserBloc());
  getIt.registerFactory(() => RepositoryBloc());
}
