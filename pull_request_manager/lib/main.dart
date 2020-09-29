import 'package:flutter/material.dart';

import 'routes.dart';
import 'setup_locator.dart';
import 'ui/screens/home_screen.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildApp();
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
