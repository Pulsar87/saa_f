import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
class ArticlePostDescription extends StatelessWidget {
  const ArticlePostDescription({
    super.key, required this.description, required this.writerName,
  });
  final String writerName;

  final description;
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
              Text(description as String
                ,style: normalTextStyle(fontWeight: FontWeight.w500),),
              if (writerName!="null")
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("كاتب المقال :  "
                    ,style:normalTextStyle(color: primaryColor,fontWeight: FontWeight.w700)),
                  Expanded(
                    child: Text(writerName
                      ,style: normalTextStyle(fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
