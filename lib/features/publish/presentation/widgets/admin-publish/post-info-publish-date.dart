import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';

class PostInfoPublishDate extends StatelessWidget {
   const PostInfoPublishDate({
    super.key, required this.date, required this.time,
  });
   final String date;
   final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "وقت النشر: ",style: normalTextStyle(color: primaryColor)),
              Expanded(
                child: Text(date,
                    style: normalTextStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                ),
              ),

            ],
          ),
          Text(
              time, style: normalTextStyle()),

        ],
      ),
    );
  }
}
