import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'accordion_video.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    Key? key,
    required this.urls,
  }) : super(key: key);

  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        //physics: const NeverScrollableScrollPhysics(), //<--here
        shrinkWrap: true,
        itemCount: urls.length,
        itemBuilder: (BuildContext context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 500),
            columnCount: 1,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: AccordionVideo(
                description:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                videoUrl: urls[index],
                videoName: "MM - T.is.B.of.A",
                nameSurname: "Mustafa Maden",
                profilePhoto: "",
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
    return Expanded(
      child: ListView.builder(
        //physics: const NeverScrollableScrollPhysics(), //<--here
        shrinkWrap: true,
        itemCount: urls.length,
        itemBuilder: (context, index) {
          return AccordionVideo(
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            videoUrl: urls[index],
            videoName: "MM - T.is.B.of.A",
            nameSurname: "Mustafa Maden",
            profilePhoto: "",
          );
        },
      ),
    )
    */

