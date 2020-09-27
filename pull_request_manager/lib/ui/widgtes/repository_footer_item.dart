import 'package:flutter/material.dart';

class RepositoryFooterItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const RepositoryFooterItem({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: Colors.black.withOpacity(0.7),
        ),
        SizedBox(width: 5.0),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
