import 'package:flutter/material.dart';

// TextStyle onBoardSubTitleTextStyle(
//     {required Color color, double fontSize = 20}) {
//   return TextStyle(
//       fontFamily: 'Handlee',
//       fontWeight: FontWeight.w900,
//       fontSize: fontSize,
//       color: color);
// }


TextStyle buttonTextStyle ( {Color color = Colors.white, double fontSize = 20,var fontWeight =  FontWeight.bold}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight);
}


TextStyle authTitleTextStyle ( {Color color =  Colors.teal, double fontSize = 30}) {
  return  TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold
  );
}


TextStyle normalTextStyle ( {Color color =  Colors.black, double fontSize = 20, var fontWeight = FontWeight.bold}) {
  return  TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight
  );
}