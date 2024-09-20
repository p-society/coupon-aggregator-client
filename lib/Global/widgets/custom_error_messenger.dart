import 'package:flutter/material.dart';

 showError(BuildContext context, {required String title,required String description}) {
  final theme = Theme.of(context);

  final snackBar = SnackBar(
    backgroundColor: Colors.red.shade50,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.red.shade200, width: 1),
    ),
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.error_outline, color: Colors.red.shade700, size: 28),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.red.shade900,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 5),
    action: SnackBarAction(
      label: 'DISMISS',
      textColor: Colors.red.shade700,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
