import 'package:flutter/material.dart';

import '../../../../core/constant/responsive/MediaQuery.dart';

BorderRadius borderRadiusPhoto() {
  return BorderRadius.only(
      topRight: Radius.circular(SizeConfig.width40!),
      topLeft: Radius.circular(SizeConfig.width40!));
}
