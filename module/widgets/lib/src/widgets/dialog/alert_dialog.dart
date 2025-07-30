import 'package:flutter/material.dart';
import 'package:widgets/src/core/dialog_base.dart';

/// Show an alert dialog for confirmation or information
final class CustomAlertDialog extends StatelessWidget {
  /// Constructor for dialog
  const CustomAlertDialog({
    required this.title,
    this.content,
    this.confirmText = 'OK',
    this.cancelText = 'Cancel',
    this.showCancel = true,
    super.key,
  });

  /// Title for the dialog
  final String title;

  /// Optional content text
  final String? content;

  /// Text for confirm button
  final String confirmText;

  /// Text for cancel button
  final String cancelText;

  /// Whether to show cancel button
  final bool showCancel;

  /// Show the alert dialog
  /// Returns [true] if confirmed, [false] if cancelled, [null] if dismissed
  static Future<bool?> show({
    required String title,
    required BuildContext context,
    String? content,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool showCancel = true,
  }) async {
    return DialogBase.show<bool?>(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        showCancel: showCancel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: content != null ? Text(content!) : null,
      actions: [
        if (showCancel)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(cancelText),
          ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(confirmText),
        ),
      ],
    );
  }
}
