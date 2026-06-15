import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../screens/video-show-info.dart';
import '../../../../../core/functions/YoutubeUrlMethod.dart';
import 'gallery-item-title.dart';
import 'gallery-video-photo.dart';

class VideoGalleryGridItem extends StatelessWidget {
  const VideoGalleryGridItem({super.key, required this.id, required this.videoUrl, required this.title});
  final int id;
  final String title;
  final String videoUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: SizeConfig.screenWidth! / 80,),
        Expanded(child: InkWell(
          onTap: () {
            print(id);
            Navigator.push(context, MaterialPageRoute(builder: (context) => VideoShowInfo(
              title:title,
              id:id,
            )
            ));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: SizeConfig.screenWidth! / 2.5,
            height: SizeConfig.screenWidth! / 2.5,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GalleryVideoPhoto(videoUrl : convertUrlToId(videoUrl)??""),
                GalleryItemTitle(title : title),
              ],
            ),
          ),
        )),
        SizedBox(width: SizeConfig.screenWidth! / 80,),
      ],
    );
  }
}


