import 'package:flutter/material.dart';

import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../image-show-info/image-info-date-info.dart';

class PostTime extends StatelessWidget {
  const PostTime({
    super.key, required this.time, required this.date,
  });
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ImageInfoDateInfo(time:time, date: date),
        ],
      ),
    );
  }
}
