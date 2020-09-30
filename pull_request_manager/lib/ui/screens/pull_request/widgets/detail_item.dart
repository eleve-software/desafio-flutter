import 'package:flutter/material.dart';

import '../../../../data/models/comment.dart';

class DetailItem extends StatelessWidget {
  final Comment comment;

  const DetailItem({
    Key key,
    @required this.comment,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: NetworkImage(
              comment.user.avatarUrl,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3d ago',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    comment.user.login,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    comment.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
