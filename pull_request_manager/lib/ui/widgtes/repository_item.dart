import 'package:flutter/material.dart';

import 'repository_footer_item.dart';

class RepositoryItem extends StatelessWidget {
  const RepositoryItem({
    Key key,
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
            'repository-name',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
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
              RepositoryFooterItem(
                icon: Icons.star,
                title: '3.1k stars',
              ),
              SizedBox(width: 5.0),
              RepositoryFooterItem(
                icon: Icons.star,
                title: '3.1k forks',
              ),
              SizedBox(width: 5.0),
              RepositoryFooterItem(
                icon: Icons.star,
                title: '3.1k PRs',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
