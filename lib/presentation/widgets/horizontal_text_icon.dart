import 'package:flutter/material.dart';

class HorizontalTextIcon extends StatelessWidget {
  final String text;
  final IconData iconData;
  final TextStyle? textStyle;
  final Color? iconColor;

  const HorizontalTextIcon({
    super.key,
    required this.text,
    required this.iconData,
    this.textStyle,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) => Wrap(
        children: [
          Icon(iconData, size: 16, color: iconColor),
          const SizedBox(width: 8),
          Text(text, style: textStyle),
        ],
      );
}
