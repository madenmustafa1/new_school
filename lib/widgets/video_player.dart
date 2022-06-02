import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late PodPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getVideo(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String url = 'https://www.youtube.com/watch?v=fnlJw9H0xAM';

  PodVideoPlayer getVideo() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(url),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: false,
        isLooping: false,
        initialVideoQuality: 360,
      ),
    )..initialise();

    return PodVideoPlayer(controller: controller);
  }
}
