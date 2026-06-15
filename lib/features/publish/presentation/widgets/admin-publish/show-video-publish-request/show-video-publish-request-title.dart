import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

class ShowVideoPublishRequestTitle extends StatelessWidget {
  ShowVideoPublishRequestTitle({
    super.key, required this.title,
  });
   final String title;

   @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Text(title,style: normalTextStyle(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis
            ),
          ),
        ],
      ),
    );
  }
}
