import 'package:flutter/material.dart';

class TextIconVertical extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  const TextIconVertical({
    super.key,
    required this.icon,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 40.0,
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
