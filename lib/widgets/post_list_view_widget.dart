import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../model/home/post_model.dart';
import 'video/accordion_video.dart';

// ignore: must_be_immutable
class PostListView extends StatelessWidget {
  PostListView({
    Key? key,
  }) : super(key: key);

  final List<String> urls = [
    // -> Observe Riverpod
    "https://www.youtube.com/watch?v=fnlJw9H0xAM",
    "https://www.youtube.com/watch?v=HsgSarKJzn0",
    "https://www.youtube.com/watch?v=HsgSarKJzn0",
    "https://www.youtube.com/watch?v=HsgSarKJzn0"
  ];

  String url =
      "https://firebasestorage.googleapis.com/v0/b/new-school--app.appspot.com/o/123.png?alt=media&token=7d8d6dba-6a56-43dd-a1bc-8cec59e7c263";

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
                postModel: PostModel(
                  videoUrl: urls[index],
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  nameSurname: "Mustafa Maden",
                  profilePhotoUrl: url,
                  videoName: "MM - T.is.B.of.A",
                  uuid: "uuid",
                  like: index * 2,
                  comment: [],
                  subject: "subject",
                  email: "email",
                ),
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

