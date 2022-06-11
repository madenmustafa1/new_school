import 'package:flutter/material.dart';
import '../../widgets/post_list_view_widget.dart';
import '/../widgets/basic_appbar.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Home"),
      body: Column(
        children: [
          PostListView( urls: urls),
        ],
      ),

    );
  }

  var urls = [
    "https://www.youtube.com/watch?v=fnlJw9H0xAM",
    "https://www.youtube.com/watch?v=HsgSarKJzn0",
    "https://www.youtube.com/watch?v=HsgSarKJzn0",
    "https://www.youtube.com/watch?v=HsgSarKJzn0"
  ];
}