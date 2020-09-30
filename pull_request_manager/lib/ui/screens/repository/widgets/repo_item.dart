import 'package:flutter/material.dart';

import '../../../../data/models/repository.dart';
import 'bottom_item.dart';

class RepositoryItem extends StatelessWidget {
  final Repository repository;

  const RepositoryItem({
    Key key,
    @required this.repository,
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
          Text(
            repository.name,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            repository.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              BottomItem(
                icon: Icons.star,
                title: repository.stargazersCount.toString(),
              ),
              SizedBox(width: 5.0),
              BottomItem(
                icon: Icons.restaurant,
                title: repository.forksCount.toString(),
              ),
              SizedBox(width: 5.0),
              BottomItem(
                icon: Icons.report_problem,
                title: repository.openIssuesCount.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
