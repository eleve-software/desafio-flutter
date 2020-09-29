import 'package:flutter/material.dart';

import '../../blocs/repository_bloc.dart';
import '../../data/models/repository.dart';
import '../../data/models/user.dart';
import '../../routes.dart';
import '../../setup_locator.dart';
import '../../shared/widgets/loading.dart';
import '../widgtes/repository_item.dart';

class RepositoryScreen extends StatefulWidget {
  final User user;
  final repositoryBloc = getIt.get<RepositoryBloc>();

  RepositoryScreen({Key key, this.user}) : super(key: key);

  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  @override
  void initState() {
    super.initState();
    widget.repositoryBloc.fetchRepositories(widget.user.login);
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
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22.0,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: NetworkImage(widget.user.avatarUrl),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        widget.user.login,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                    color: Colors.red.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: StreamBuilder<List<Repository>>(
                stream: widget.repositoryBloc.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final repositories = snapshot.data;
                    return ListView.builder(
                      itemCount: repositories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: RepositoryItem(
                            repository: repositories[index],
                          ),
                          onTap: () => Navigator.pushNamed(
                            context,
                            Routes.pullRequest,
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Loading(
                      text: '⌛ Carregando repositórios...',
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
