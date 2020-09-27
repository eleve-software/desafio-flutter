import 'package:flutter/widgets.dart';

import 'ui/screens/home_screen.dart';
import 'ui/screens/repository_screen.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String repository = '/repository';

  static final routes = <String, WidgetBuilder>{
    home: (context) => HomeScreen(),
    repository: (context) => RepositoryScreen(),
  };
}
