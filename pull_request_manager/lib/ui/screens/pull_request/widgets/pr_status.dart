import 'package:flutter/material.dart';

class PullRequestStatus extends StatelessWidget {
  final String status;
  final int id;
  final DateTime timeAgo;

  const PullRequestStatus({
    Key key,
    @required this.status,
    @required this.id,
    @required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final daysAgo = DateTime.now().difference(timeAgo).inDays.toString();

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: status == 'open'
                ? Theme.of(context).primaryColor.withOpacity(0.6)
                : Colors.red.withOpacity(0.6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 8.0,
            ),
            child: Text(
              status,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Text(
          '#${id.toString()}',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 10.0),
        Text(
          '${daysAgo}d ago',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
