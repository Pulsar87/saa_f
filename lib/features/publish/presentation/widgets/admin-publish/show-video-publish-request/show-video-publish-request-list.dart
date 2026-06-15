import 'package:flutter/material.dart';
import 'package:saa_f/features/publish/presentation/widgets/admin-publish/show-video-publish-request/show-video-request-item.dart';

class ShowVideoPublishRequestList extends StatelessWidget {
  const ShowVideoPublishRequestList({
    super.key, required this.videoList,
  });
  final  List <dynamic> videoList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        itemBuilder: (context, index) => ShowVideoRequestItem(title: videoList[index]['title']??"title",videoUrl:  videoList[index]['video_url'],date: videoList[index]['created_at_relative'],id: videoList[index]['id'],photographer:""),
      separatorBuilder: (context , index) => const SizedBox(height: 20,),
      itemCount: videoList.length,
    );
  }
}

