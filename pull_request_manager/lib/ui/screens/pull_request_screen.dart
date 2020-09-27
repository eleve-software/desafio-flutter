import 'package:flutter/material.dart';
import 'package:pull_request_manager/routes.dart';

import '../widgtes/back_button.dart';
import '../widgtes/pull_request_item.dart';

class PullRequestScreen extends StatelessWidget {
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
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: PullRequestItem(),
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.pullRequestDetail,
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
