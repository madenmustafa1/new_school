import 'package:flutter/material.dart';
import '../../widgets/video_player.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  MediaQueryData? mediaQuery;
  @override
  Widget build(BuildContext context) {
    mediaQuery ??= MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaQuery!.size.height / 2,
              child: const CustomVideoPlayer(),
            ),
            returnListViewBuilder(),
          ],
        ),
      ),
    );
  }

  var urls = [
    "https://www.youtube.com/watch?v=fnlJw9H0xAM",
    "https://www.youtube.com/watch?v=HsgSarKJzn0"
  ];

  Widget returnListViewBuilder() {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: urls.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(urls[index]),
          );
        },
      ),
    );
  }
}
