import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../core/functions/YoutubeUrlMethod.dart';

class ShowVideoPublishRequestPhoto extends StatelessWidget {

  const ShowVideoPublishRequestPhoto({Key? key, required this.videoUrl}) : super(key: key);
final String videoUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 5, 5),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        color: Colors.grey,
        image: DecorationImage(
    image: NetworkImage(
    YoutubePlayer.getThumbnail(videoId: youtubeUrlMethod(videoUrl),),
        ),
        ),
      ),
    );
  }
}
