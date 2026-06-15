import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/publish/presentation/widgets/admin-publish/post-publish-request-date.dart';
import 'package:saa_f/features/publish/presentation/widgets/admin-publish/show-video-publish-request/show-video-publish-request-title.dart';

class PostPublishRequestInfo extends StatelessWidget {
  PostPublishRequestInfo({
    super.key, required this.title, required this.date, required this.photographer,
  });
  final String title;
   final String date;
   final String photographer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowVideoPublishRequestTitle(title: title),
          SizedBox(height: 10,),
          Text(photographer, style: normalTextStyle(),),
          PostPublishRequestDate(date: date),


        ],
      ),
    );
  }
}
