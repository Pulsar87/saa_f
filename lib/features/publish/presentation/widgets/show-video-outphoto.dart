import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class ShowViedoPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(YoutubePlayer.getThumbnail(
    videoId: "Z-Or1sSQ0js",
    ),
      height: 500,
      width: 500,
    )
    ;
  }
}
