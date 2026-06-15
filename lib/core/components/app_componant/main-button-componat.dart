import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
class MainButtonComponent extends StatelessWidget {
  const MainButtonComponent({
    super.key,
    this.horizontalMargin =0,
    this.verticalMargin = 16,
    this.horizontalPadding=0,
    this.verticalPadding=0,
    this.buttonHorizontalPadding = 12,
    this.buttonVerticalPadding=12,
    this.containerBorderRadius = 25,
    this.minWidth= double.infinity,
    this.containerColor,
    this.textColor = Colors.white,
    // this.buttonColor = Colors.transparent,
    this.elevation = 16,
    required this.onPressed,
    required this.child,
     this.text = "fff",

  });
  final double horizontalMargin;
  final double verticalMargin;
  final double verticalPadding;
  final double horizontalPadding;
  final double buttonHorizontalPadding;
  final double buttonVerticalPadding;
  // final Color buttonColor;
  final double containerBorderRadius;
  final Color? containerColor;
  final Color textColor;
  final double elevation;
  final double minWidth;
  final Function() onPressed;
  final Widget child;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
          vertical: verticalMargin
      ),
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 2),
        // gradient: const LinearGradient(
        //   colors: [primaryColorDark,primaryColorDark,primaryColorDark,lightBlue], // الألوان التي تريدها في التدرج
        //   begin: Alignment.centerLeft, // بداية التدرج من الزاوية العليا اليسرى
        //   end: Alignment.centerRight, // نهاية التدرج في الزاوية السفلية اليمنى
        // ),

        boxShadow: [
              const BoxShadow(
                color: Colors.grey,
                //  spreadRadius: 5,
                blurRadius: 5,
                // offset: Offset(7, 5), // changes position of shadow
              ),
            ],

      borderRadius: BorderRadius.all(Radius.circular(containerBorderRadius)),
        color: containerColor??primaryColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        textColor: textColor,
        minWidth: minWidth,
        elevation: elevation,
        child: child,
      ),
    );

  }
}
