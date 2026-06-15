import 'package:flutter/material.dart';

import '../../../../core/constant/responsive/MediaQuery.dart';

BoxDecoration boxDecorationText() {
  return BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(SizeConfig.width40!),
        bottomRight: Radius.circular(SizeConfig.width40!)),
    color: Colors.grey,
  );
}
