// import 'package:flutter/material.dart';
//
// class TextFormFieldComponent extends StatelessWidget {
//   TextFormFieldComponent(
//       {Key? key,
//       this.verticalPadding = 10,
//       this.horizontalPadding = 10,
//       this.textAlign = TextAlign.start,
//       this.onTap,
//       this.controller,
//       this.textInputType,
//       this.validate,
//       this.floatingLabelBehavior,
//       this.labelText,
//       this.prefixIcon,
//       this.border,
//       this.initValue,
//       this.onPressed,
//       this.onChanged,
//       this.labelSize,
//       this.enabled = true})
//       : super(key: key);
//
//   final GestureTapCallback? onTap;
//   final TextEditingController? controller;
//   final TextInputType? textInputType;
//   final FormFieldValidator<String>? validate;
//   final bool obscureText = false;
//   final FloatingLabelBehavior? floatingLabelBehavior;
//   final String? labelText;
//   final Widget? prefixIcon;
//   final InputBorder? border;
//   final String? initValue;
//   final VoidCallback? onPressed;
//   final bool enabled;
//   final TextInputAction? action = TextInputAction.next;
//   final Function(String)? onChanged;
//   final double? labelSize;
//   final double verticalPadding;
//   final double horizontalPadding;
//   final TextAlign textAlign;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       textAlign: textAlign,
//       textInputAction: action,
//       enabled: enabled,
//       initialValue: initValue,
//       onTap: onTap,
//       controller: controller,
//       keyboardType: textInputType,
//       validator: validate,
//       obscureText: obscureText,
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         floatingLabelBehavior: floatingLabelBehavior,
//         contentPadding: EdgeInsets.symmetric(
//             vertical: verticalPadding, horizontal: horizontalPadding),
//         labelText: labelText,
//         labelStyle: TextStyle(fontSize: labelSize),
//         focusedBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//         ),
//         disabledBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           borderSide: BorderSide(width: 1, color: Colors.grey),
//         ),
//         errorBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           borderSide: BorderSide(width: 1, color: Colors.red),
//         ),
//         focusedErrorBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           borderSide: BorderSide(width: 2, color: Colors.red),
//         ),
//         enabledBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           borderSide: BorderSide(width: 1, color: Colors.grey),
//         ),
//         prefixIcon: prefixIcon,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../constant/colors/light-colors.dart';


class TextFormFieldComponent extends StatelessWidget {
  TextFormFieldComponent(
      {Key? key,
        this.contentHorizontalPadding = 16,
        this.contentVerticalPadding = 16,
        this.horizontalPadding = 0,
        this.verticalPadding = 0,
        this.textAlign = TextAlign.start,
        this.onTap,
        this.controller,
        this.textInputType,
        this.validate,
        this.floatingLabelBehavior,
        this.labelText,
        this.prefixIcon,
        this.border,
        this.initValue,
        this.onPressed,
        this.onChanged,
        this.labelSize,
        this.enabled = true,
        this.obscureText=false,
        this.maxLines,
        this.hintText,
        this.suffixIcon,
      })
      : super(key: key);

  final GestureTapCallback? onTap;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validate;
  final bool obscureText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final String? initValue;
  final VoidCallback? onPressed;
  final bool enabled;
  final TextInputAction? action = TextInputAction.next;
  final Function(String)? onChanged;
  final double? labelSize;
  final double verticalPadding;
  final double horizontalPadding;
  final double contentVerticalPadding;
  final double contentHorizontalPadding;
  final TextAlign textAlign;
  final int? maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding , vertical:verticalPadding ),
      child: TextFormField(

        textAlign: textAlign,
        textInputAction: action,
        enabled: enabled,
        initialValue: initValue,
        onTap: onTap,
        controller: controller,
        keyboardType: textInputType,
        validator: validate,
        obscureText: obscureText,
        onChanged: onChanged,
        maxLines: obscureText ? 1 : maxLines,
        decoration: InputDecoration(

          hintText: hintText,
          floatingLabelBehavior: floatingLabelBehavior,
          contentPadding: EdgeInsets.symmetric(vertical: contentVerticalPadding, horizontal: contentHorizontalPadding),
          labelText: labelText,
          labelStyle: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(width: 3,color: primaryColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(width: 3, color: lightGrey!),
          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(width: 3, color: errorColor),
          ),
          focusedErrorBorder: OutlineInputBorder(

            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(width: 3, color: errorColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(width: 3, color: Colors.grey),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
