import 'package:flutter/material.dart';

import '../../../../data/models/pull_request.dart';
import 'pr_status.dart';

class PullRequestItem extends StatelessWidget {
  final String repository;
  final PullRequest pullRequest;

  const PullRequestItem({
    Key key,
    @required this.repository,
    @required this.pullRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 8.0,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star, color: Colors.black54),
              Text(
                '${pullRequest.user.login}/$repository',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Text(
              pullRequest.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          PullRequestStatus(
            status: pullRequest.state,
            id: pullRequest.number,
            timeAgo: pullRequest.createdAt,
          ),
        ],
      ),
    );
  }
}
