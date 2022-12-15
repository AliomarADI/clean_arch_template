import 'package:flutter/material.dart';

class TTAlertDialog {
  static Future<bool?> showTTAlertDialog({
    required BuildContext context,
    required Widget content,
    bool isDismissible = true,
  }) async =>
      showDialog<bool>(
        context: context,
        barrierDismissible: isDismissible,
        barrierColor: const Color.fromRGBO(19, 9, 49, 0.24),
        builder: (context) => AlertDialog(
          elevation: 0,
          content: content,
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
        ),
      );
}
