import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/functions/YoutubeUrlMethod.dart';

class ShowVideo extends StatefulWidget {
  ShowVideo({super.key, required this.videoUrl, this.autoPlay = true, this.showVideoProgressIndicator = true});

  final String videoUrl;
  final bool autoPlay;
  final bool showVideoProgressIndicator;

  @override
  _ShowVideoState createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: youtubeUrlMethod(widget.videoUrl),
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: widget.showVideoProgressIndicator,
        // progressIndicatorColor: Colors.blue,
        onReady: () {
          print('تم تحميل الفيديو!');
        },
      ),
    );
  }
}
