
import 'package:flutter/material.dart';

import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/themes/text_style.dart';

class ImagePostDescription extends StatelessWidget {
  const ImagePostDescription({
    super.key, required this.description, required this.photographerName,
  });
  final String photographerName;

  final String description;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        // border: Border.all(color:lightGrey!,width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],

      ),
      child:
      Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description
                ,style: normalTextStyle(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("بعدسة :  "
                    ,style: normalTextStyle (color: primaryColor)

                  ),
                  Expanded(
                    child: Text(photographerName
                      ,style: normalTextStyle(),
                  ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
