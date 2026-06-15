import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

void showCustomSnackBar(BuildContext context, String message, Color color) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: normalTextStyle(color: Colors.white,fontSize: 18),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 1),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
