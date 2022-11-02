import 'package:flutter/material.dart';

class OnFailureWidget extends StatelessWidget {
  final String message;
  final bool withRefreshButton;
  final Function()? onTap;

  const OnFailureWidget({
    super.key,
    required this.message,
    required this.withRefreshButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        const SizedBox(height: 16.0),
        if (withRefreshButton)
          ElevatedButton.icon(
            onPressed: onTap,
            icon: const Icon(Icons.refresh),
            label: const Text("Reload"),
          ),
      ],
    );
  }
}
