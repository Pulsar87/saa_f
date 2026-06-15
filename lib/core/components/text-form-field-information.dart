import 'package:flutter/material.dart';

import '../constant/colors/dark-colors.dart';
import '../constant/colors/light-colors.dart';
import '../constant/responsive/MediaQuery.dart';

class TextFromFieldInformation extends StatelessWidget {
  final String? text;
  final bool isIcons;
  final String? hintText;
  final bool isChanged;
  final FormFieldValidator<String>? validate;
  final Function()? function;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final double horizontalPadding;

  const TextFromFieldInformation({
    Key? key,
    this.text,
    this.hintText,
    this.controller,
    this.isChanged = true,
    this.isIcons = false,
    this.function,
    this.validate,
    this.textInputType,
    this.prefixIcon,
    this.horizontalPadding = 0,
    this.suffixIcon,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      prefixIcon: isIcons
          ? GestureDetector(
              onTap: function, // Invoke the function callback when tapped
              child: const Icon(Icons.timer),
            )
          : prefixIcon,
      labelText: text,
      enabled: enabled,
      hintText: hintText,
      labelStyle: TextStyle(color: primaryColor,fontFamily: 'Handlee',fontSize: 20, fontWeight: FontWeight.w900),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig.height50!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        // borderSide: BorderSide(color: PmainColor),
        borderSide: BorderSide(width: 3,color: primaryColor),
      ),
      enabledBorder:  OutlineInputBorder(

        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width:2, color: darkGrey!),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(width: 1, color:  darkGrey!),
      ),

      suffixIcon: suffixIcon,
    );

    return SizedBox(
      width: SizeConfig.width1, // Provide a width constraint
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: TextFormField(
          onTap: function,
          readOnly: isChanged,
          decoration: inputDecoration,
          controller: controller,
          validator: validate,
          keyboardType: textInputType,
        ),
      ),
    );
  }
}
