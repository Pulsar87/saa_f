import 'package:flutter/material.dart';

import '../constant/responsive/MediaQuery.dart';

class HorizantalaLine extends StatelessWidget {
  final width;
  final Color boxDecorationColor;
  const HorizantalaLine({
    super.key,
    this.width = 2,
    this.boxDecorationColor = Colors.black,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: boxDecorationColor,
      ),
    );
  }
}
