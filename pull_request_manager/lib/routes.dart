import 'package:flutter/widgets.dart';

import 'ui/screens/home/home_screen.dart';
import 'ui/screens/pull_request/detail_screen.dart';
import 'ui/screens/pull_request/pr_screen.dart';
import 'ui/screens/repository/repo_screen.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String repository = '/repository';
  static const String pullRequest = '/pullrequest';
  static const String pullRequestDetail = '/pullrequest-detail';

  static final routes = <String, WidgetBuilder>{
    home: (context) => HomeScreen(),
    repository: (context) => RepositoryScreen(),
    pullRequest: (context) => PullRequestScreen(),
    pullRequestDetail: (context) => DetailScreen(),
  };
}
