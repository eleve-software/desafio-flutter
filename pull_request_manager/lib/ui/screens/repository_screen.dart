import 'package:flutter/material.dart';
import 'package:pull_request_manager/routes.dart';

import '../widgtes/repository_item.dart';

class RepositoryScreen extends StatelessWidget {
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
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(45.0),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        '@username',
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
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: RepositoryItem(),
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.pullRequest,
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
