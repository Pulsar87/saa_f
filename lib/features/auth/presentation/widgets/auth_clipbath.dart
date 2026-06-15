import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';

class AuthClipPath extends StatelessWidget {
  const AuthClipPath({
    super.key, required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: SizeConfig.screenHeight! / 3,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Colors.teal[500]!,
                Colors.teal[500]!,
                Colors.teal[500]!,
                Colors.teal[400]!,
                Colors.teal[400]!,
                Colors.teal[300]!,
                Colors.teal[300]!,
                Colors.teal[300]!,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Align(
              alignment: Alignment.center,
              child: Image(
                image:
                AssetImage(imagePath),
              )),
        ),
      ),
    );
  }
}


class ScreenClipPath extends StatelessWidget {
  const ScreenClipPath({super.key, required this.imagePath, required this.h});
  final String imagePath;
  final double h;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: SizeConfig.screenHeight! /h,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Colors.teal[500]!,
                Colors.teal[500]!,
                Colors.teal[500]!,
                Colors.teal[400]!,
                Colors.teal[400]!,
                Colors.teal[300]!,
                Colors.teal[300]!,
                Colors.teal[300]!,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Align(
              alignment: Alignment.center,
              child: Image(
                image:
                AssetImage(imagePath),
              )),
        ),
      ),
    );
  }
}
