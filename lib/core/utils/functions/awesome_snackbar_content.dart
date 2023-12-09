import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

showAwesomeSnackbar({
  required BuildContext context,
  required String title,
  required String message,
  required ContentType contentType,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    margin: const EdgeInsets.only(bottom: 55),
    padding: const EdgeInsets.all(4),
    clipBehavior: Clip.none,
    // elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: Directionality(
      textDirection: TextDirection.rtl,
      child: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    ),
  ));
}
