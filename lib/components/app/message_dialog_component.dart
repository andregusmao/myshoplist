import 'package:flutter/material.dart';

class MessageDialogComponent {
  static void showSimpleMessage(
      BuildContext context, String? title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        );
      },
    );
  }
}
