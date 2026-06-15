import 'package:flutter/material.dart';
import 'package:saa_f/screens/conect_us/whatsapp.dart';

import '../../core/constant/colors/light-colors.dart';
import '../../core/themes/text_style.dart';

class ConnectUsListTile extends StatelessWidget {
  const ConnectUsListTile({
    super.key, required this.name, required this.img, required this.number,
  });
  final String name;
  final String img;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor,
        gradient: LinearGradient(
          colors: [
            primaryColor,
            PlightgreenColor,
          ], // الألوان التي تريدها في التدرج
          begin: Alignment.centerLeft, // بداية التدرج من الزاوية العليا اليسرى
          end: Alignment.centerRight, // نهاية التدرج في الزاوية السفلية اليمنى
        ),

      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 42,
            backgroundColor: Colors.white,

            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(img),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(child: Text(name,style: normalTextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900),)),
          ConectUsWhatsappButton(number: number,)
        ],
      ),
    );
  }
}
