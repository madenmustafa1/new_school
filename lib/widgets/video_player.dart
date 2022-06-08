import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final PodPlayerController videoController;
  const CustomVideoPlayer(
      {Key? key, required this.videoUrl, required this.videoController})
      : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  PodPlayerController? controller;
  PodVideoPlayer? podVideoPlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getVideo(),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  String url = 'https://www.youtube.com/watch?v=fnlJw9H0xAM';

  PodVideoPlayer getVideo() {
    return PodVideoPlayer(controller: widget.videoController);
  }
}
