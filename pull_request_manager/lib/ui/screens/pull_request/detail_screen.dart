import 'package:flutter/material.dart';

import '../../../data/models/pull_request.dart';
import '../../widgtes/back_button.dart';
import 'widgets/detail_item.dart';
import 'widgets/pr_status.dart';

class DetailScreen extends StatelessWidget {
  final PullRequest pullRequest;

  const DetailScreen({
    Key key,
    @required this.pullRequest,
  }) : super(key: key);

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
                      status: pullRequest.state,
                      id: pullRequest.number,
                      timeAgo: pullRequest.createdAt,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pullRequest.title,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          pullRequest.body,
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
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return DetailItem();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
