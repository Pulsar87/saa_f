import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

class PostPublishRequestDate extends StatelessWidget {
  PostPublishRequestDate({
    super.key, required this.date,
  });
  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(date,
        style: normalTextStyle(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis
    );
  }
}
