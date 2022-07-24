import 'package:flutter/material.dart';
import '/widgets/menu_drawer.dart';
import '/widgets/post_list_view_widget.dart';
import '/widgets/basic_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Home"),
      body: Column(
        children: [
          PostListView(),
        ],
      ),
      drawer: MenuDrawer(),
    );
  }
}
