import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final String fontFamily;

  const TitleTextWidget({
    Key? key,
    required this.text,
    this.fontSize = 16.0,
    required this.color,
    this.fontFamily = "Poppins",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color.withOpacity(0.7),
        fontFamily: fontFamily,
      ),
    );
  }
}
