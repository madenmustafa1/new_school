import 'package:flutter/material.dart';
import 'package:new_school/widgets/accordion_video.dart';
import 'package:new_school/widgets/basic_appbar.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Home"),
      body: Column(
        children: [
          /*
          SizedBox(
            height: mediaQuery!.size.height / 2,
            child: const CustomVideoPlayer(),
          ),
          */
          returnListViewBuilder(),
        ],
      ),
    );
  }

  var urls = [
    "https://www.youtube.com/watch?v=fnlJw9H0xAM",
    "https://www.youtube.com/watch?v=HsgSarKJzn0"
  ];

  Widget returnListViewBuilder() {
    return Expanded(
      child: SizedBox(
        //width: double.infinity,
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
      ),
    );
  }
}
