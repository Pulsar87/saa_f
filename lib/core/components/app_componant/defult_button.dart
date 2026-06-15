import 'dart:core';

import 'package:flutter/material.dart';

import '../../constant/colors/light-colors.dart';
class DefultButton extends StatelessWidget {
  const DefultButton({
    super.key,
    this.horizontalMargin =0,
    this.verticalMargin = 16,
    this.horizontalPadding=0,
    this.verticalPadding=0,
    this.buttonHorizontalPadding = 12,
    this.buttonVerticalPadding=12,
    this.containerBorderRadius = 10,
    this.minWidth= double.infinity,
    this.containerColor,
    this.textColor = Colors.white,
    this.buttonColor = Colors.transparent,
    this.elevation = 16,
    required this.onPressed,
    required this.child,

  });
  final double horizontalMargin;
  final double verticalMargin;
  final double verticalPadding;
  final double horizontalPadding;
  final double buttonHorizontalPadding;
  final double buttonVerticalPadding;
  final Color buttonColor;
  final double containerBorderRadius;
  final Color? containerColor;
  final Color textColor;
  final double elevation;
  final double minWidth;
  final Function() onPressed;
  final Widget child;


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
        //   gradient: LinearGradient(
        //   colors: [
        //     Color(0xff000066 ),
        //
        //     Color(0xFF2E2E7B),
        //     // Color(0xFF283593),
        //     // Color(0xff000055 ),
        //     // Colors.lightBlue[600]!,
        //     Color(0xFF006064),
        //
        //     // Color(0xFF00838F),
        //     Color(0xFF0097A7),
        //     // Color(0xFF4DD0E1),
        //     // Colors.lightBlue[400]!,
        //   ],
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        // ),

        borderRadius: BorderRadius.all(Radius.circular(containerBorderRadius)),
        color: containerColor??primaryColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(
            horizontal : buttonHorizontalPadding,
            vertical: buttonVerticalPadding
        ),
        textColor: textColor,
        minWidth: minWidth,
        color: buttonColor,
        elevation: elevation,
        child: child,
      ),
    );
  }
}




Widget defaultFormField({
  TextEditingController? controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  VoidCallback? suffixPressed,
  FormFieldValidator? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  bool isPassword = false,

}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: validate,
        obscureText: isPassword,
        decoration:
        InputDecoration(
          prefixIcon: Icon(
            prefix,
            color: PmainColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffix,
                color: PRedColor,
              ))
              : null,
          prefixIconColor: Porange2Color,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: PmainColor),
          ),
        ));
