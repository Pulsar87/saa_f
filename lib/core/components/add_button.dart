import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    this.height = 50,
    this.width = 50,
    this.verticalPadding = 30,
    required this.onPressed});
  final double height;
  final double width;
  final double verticalPadding;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalPadding ),

      height: height,
      width: width,
      decoration: BoxDecoration(
        color: primaryColor,
        // gradient: const LinearGradient(
        //   colors: [primaryColorLight,primaryColorLight,primaryColorLight,primaryColorLight, primaryColorDark], // الألوان التي تريدها في التدرج
        //   begin: Alignment.topRight, // بداية التدرج من الزاوية العليا اليسرى
        //   end: Alignment.bottomLeft, // نهاية التدرج في الزاوية السفلية اليمنى
        // ),
        boxShadow: [
          const BoxShadow(
            color: Colors.grey,
            //  spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(-3, -2), // changes position of shadow
          ),
        ],

        borderRadius: const BorderRadius.all(Radius.circular(8)),
        // borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.add,color: Colors.white,size: 25,weight: 5,),
      ),

    );
  }
}
