import 'package:flutter/material.dart';

import '../../../../../core/themes/text_style.dart';

class ImageInfoDateInfo extends StatelessWidget {
   ImageInfoDateInfo({
    super.key, required this.time, required this.date,
  });
   final String time;
   final String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(date,
            style: normalTextStyle(color: Colors.grey[600]!),
            maxLines: 2,
            overflow: TextOverflow.ellipsis
        ),
        Text(
            time,
          style: normalTextStyle(color: Colors.grey[600]!),
        ),

      ],
    );
  }
}
