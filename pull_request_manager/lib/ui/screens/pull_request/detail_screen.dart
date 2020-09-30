import 'package:flutter/material.dart';

import '../../../blocs/comment_bloc.dart';
import '../../../data/models/comment.dart';
import '../../../data/models/pull_request.dart';
import '../../../setup_locator.dart';
import '../../../shared/strings.dart';
import '../../widgtes/back_button.dart';
import '../../widgtes/loading.dart';
import 'widgets/detail_item.dart';
import 'widgets/pr_status.dart';

class DetailScreen extends StatefulWidget {
  final PullRequest pullRequest;
  final commentBloc = getIt.get<CommentBloc>();

  DetailScreen({
    Key key,
    @required this.pullRequest,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    widget.commentBloc.fetchComments(widget.pullRequest.issueUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 12.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AppBackButton(iconStyle: 'ios'),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: PullRequestStatus(
                      status: widget.pullRequest.state,
                      id: widget.pullRequest.number,
                      timeAgo: widget.pullRequest.createdAt,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pullRequest.title,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          widget.pullRequest.body,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.0,
                            height: 1.3,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: StreamBuilder<List<Comment>>(
                stream: widget.commentBloc.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        Strings.commentNotFound,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    final comments = snapshot.data;
                    if (comments.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          Strings.commentEmpty,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return DetailItem(comment: comments[index]);
                      },
                    );
                  }
                  return Loading(text: Strings.commentLoading);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
