import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../core/constant/colors/light-colors.dart';

class JoinText extends StatelessWidget {
  const JoinText({
    Key? key,
    required this.text,
    this.overflow,
    this.isHeader = false,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String text;
  final TextOverflow? overflow;
  final bool isHeader;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
    // isHeader ?
    normalTextStyle( color: primaryColor,fontSize: 25);
    // Theme.of(context)
    //         .textTheme
    //         .headlineSmall!
    //         .copyWith(color: primaryColor);
        // : Theme.of(context).textTheme.headlineSmall!;

    return Center(
      child: Text(
        text,
        style: textStyle,
        textAlign: textAlign,
        overflow: overflow,
      ),
    );
  }
}
