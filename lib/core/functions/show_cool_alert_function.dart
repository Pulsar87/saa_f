import 'package:flutter/material.dart';

import '../constant/app_media_query.dart';
import '../themes/text_style.dart';

void appCoolAlertMethod({required String text, String title = '', required BuildContext context, void Function()? thenAction}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 50),
            SizedBox(height: 16),
            if (title.isNotEmpty)
              Text(title, style: normalTextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            if (title.isNotEmpty)
              SizedBox(height: 8),
            Text(text, style: normalTextStyle(fontSize: 20), textAlign: TextAlign.center),
          ],
        ),
      );
    },
  ).then((value) => thenAction?.call());
  
  // Auto close after 2 seconds
  Future.delayed(Duration(seconds: 2), () {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      thenAction?.call();
    }
  });
}

void appCoolAlertMethod2({
  required String text,
  String title = '',
  required BuildContext context,
  void Function()? thenAction
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 50),
            SizedBox(height: 16),
            if (title.isNotEmpty)
              Text(title, style: normalTextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            if (title.isNotEmpty)
              SizedBox(height: 8),
            Text(text, style: normalTextStyle(fontSize: 20), textAlign: TextAlign.center),
          ],
        ),
      );
    },
  ).then((value) {
    thenAction?.call();
  });
  
  // Auto close after 2 seconds
  Future.delayed(Duration(seconds: 2), () {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      thenAction?.call();
    }
  });
}

// Error alert method
void appErrorAlertMethod({required String text, String title = '', required BuildContext context, void Function()? thenAction}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, color: Colors.red, size: 50),
            SizedBox(height: 16),
            if (title.isNotEmpty)
              Text(title, style: normalTextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            if (title.isNotEmpty)
              SizedBox(height: 8),
            Text(text, style: normalTextStyle(fontSize: 20), textAlign: TextAlign.center),
          ],
        ),
      );
    },
  ).then((value) => thenAction?.call());
}
