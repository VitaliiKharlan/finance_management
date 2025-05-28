import 'package:flutter/material.dart';

import 'confirmation_dialog.dart';

Future<void> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirmed,
  VoidCallback? onCancelled,
  String confirmText = 'Yes',
  String cancelText = 'No',
}) {
  return showDialog(
    context: context,
    builder:
        (context) => ConfirmationDialog(
          title: title,
          message: message,
          confirmText: confirmText,
          cancelText: cancelText,
          onConfirmed: onConfirmed,
          onCancelled: onCancelled,
        ),
  );
}
