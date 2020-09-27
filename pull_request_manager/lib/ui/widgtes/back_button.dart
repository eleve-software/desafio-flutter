import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final String iconStyle;
  final Color color;

  const AppBackButton({
    Key key,
    this.iconStyle,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconStyle == 'ios' ? Icons.arrow_back_ios : Icons.arrow_back,
        color: color ?? Colors.black87,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
