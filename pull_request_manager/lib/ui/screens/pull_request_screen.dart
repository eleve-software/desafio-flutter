import 'package:flutter/material.dart';

import '../../blocs/pull_request_bloc.dart';
import '../../data/models/pull_request.dart';
import '../../routes.dart';
import '../../setup_locator.dart';
import '../../shared/widgets/loading.dart';
import '../widgtes/back_button.dart';
import '../widgtes/pull_request_item.dart';

class PullRequestScreen extends StatefulWidget {
  final String username;
  final String repository;
  final pullRequestBloc = getIt.get<PullRequestBloc>();

  PullRequestScreen({
    Key key,
    @required this.username,
    @required this.repository,
  }) : super(key: key);

  @override
  _PullRequestScreenState createState() => _PullRequestScreenState();
}

class _PullRequestScreenState extends State<PullRequestScreen> {
  @override
  void initState() {
    super.initState();
    widget.pullRequestBloc.fetchPullRequests(
      widget.username,
      widget.repository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppBackButton(iconStyle: 'ios'),
                      SizedBox(width: 10.0),
                      Text(
                        'Pull Requests',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: StreamBuilder<List<PullRequest>>(
                stream: widget.pullRequestBloc.stream,
                builder: (context, snapshot) {
                  final pullRequests = snapshot.data;
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: pullRequests.length,
                      itemBuilder: (context, index) {
                        final pullRequest = pullRequests[index];
                        // TODO: Itens e implementação dos comments
                        return GestureDetector(
                          child: PullRequestItem(),
                          onTap: () => Navigator.pushNamed(
                            context,
                            Routes.pullRequestDetail,
                          ),
                        );
                      },
                    );
                  }
                  return Loading(text: '⌛ Carregando pull requests...');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
