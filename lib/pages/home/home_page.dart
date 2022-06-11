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
          PostListView(),
        ],
      ),
    );
  }
}
