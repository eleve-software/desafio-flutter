import 'package:flutter/material.dart';

import 'setup_locator.dart';
import 'ui/screens/home/home_screen.dart';

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
      primarySwatch: Colors.teal,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: HomeScreen(),
  );
}
