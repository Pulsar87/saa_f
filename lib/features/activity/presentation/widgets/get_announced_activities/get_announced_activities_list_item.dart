import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/features/activity/presentation/widgets/get_announced_activities/get_announced_activities_list_img.dart';

import '../../../../../core/themes/text_style.dart';

class GetAnnouncedActivitiesListItem extends StatelessWidget {
  const GetAnnouncedActivitiesListItem({super.key, required this.img, required this.title, required this.date, required this.description, required this.id, required this.age});
  final String img;
  final String title;
  final String date;
  final String description;
  final String age;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      // width: double.infinity,
      height: 180,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: primaryColor!,
          width: 3,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShowActivityPhoto(img: img),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: normalTextStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                ),
                Text(description,
                    style: normalTextStyle(fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                ),
                Text(date,
                    style: normalTextStyle(fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                ),
                Text(age,
                    style: normalTextStyle(fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                ),
              ],
            ),
          ),

          // PostPublishRequestInfo(title: title,date: date, photographer: photographer,),
        ],
      ),
    );

  }
}
