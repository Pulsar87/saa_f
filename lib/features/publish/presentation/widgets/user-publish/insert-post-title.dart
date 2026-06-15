import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/constant/responsive/MediaQuery.dart';

class InsertPostTitle extends StatelessWidget {
  const InsertPostTitle({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
          style: normalTextStyle(fontSize: 25)
      ),
    );
  }
}
