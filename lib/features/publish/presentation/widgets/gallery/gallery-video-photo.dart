import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/functions/YoutubeUrlMethod.dart';

class GalleryVideoPhoto extends StatelessWidget {
   GalleryVideoPhoto({
    super.key, required this.videoUrl,
  });
  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenWidth! / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            YoutubePlayer.getThumbnail(videoId: videoUrl,),
            // YoutubePlayer.getThumbnail(videoId: youtubeUrlMethod(videoUrl),),
          ),
        ),
      ),
    );
  }
}


