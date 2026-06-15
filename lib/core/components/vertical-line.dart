import 'package:flutter/material.dart';

import '../constant/responsive/MediaQuery.dart';

class VerticalLine extends StatelessWidget {
  final width;
  final Color boxDecorationColor;
  const VerticalLine({
    super.key,
    this.width = 2,
    this.boxDecorationColor = Colors.black,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight!/2,
      width: width,
      decoration: BoxDecoration(
        color: boxDecorationColor,
      ),
    );
  }
}
