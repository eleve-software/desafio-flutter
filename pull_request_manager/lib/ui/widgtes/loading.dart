import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String text;

  const Loading({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.0),
        CircularProgressIndicator(),
      ],
    );
  }
}
