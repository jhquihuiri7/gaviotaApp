import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextStyle style;
  final String text;

  TextWidget({required this.style, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: style,
      overflow: TextOverflow.ellipsis,
    );
  }
}
