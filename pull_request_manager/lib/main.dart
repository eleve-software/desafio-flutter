import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/user_bloc.dart';
import 'data/data_providers/github_provider.dart';
import 'data/repositories/user_repository.dart';
import 'data/services/client_service.dart';
import 'routes.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<UserBloc>(
      create: (_) => UserBloc(
        UserRepository(
          GitHubProvider(
            ClientService().getClient(),
          ),
        ),
      ),
      child: _buildApp(),
      dispose: (_, userBloc) => userBloc.dispose(),
    );
  }
}

MaterialApp _buildApp() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Pull Request Manager',
    theme: ThemeData(
      primarySwatch: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    routes: Routes.routes,
    home: HomeScreen(),
  );
}
