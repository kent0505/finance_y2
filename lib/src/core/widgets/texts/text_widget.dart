import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.title, {
    super.key,
    required this.fontSize,
    this.fontFamily = Fonts.medium,
    this.color = Colors.white,
    this.textAlign,
    this.maxLines,
  });

  final String title;
  final double fontSize;
  final String fontFamily;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }
}
