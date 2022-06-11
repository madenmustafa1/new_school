import 'package:flutter/material.dart';

import '../../widgets/basic_appbar.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "History"),
      body: const Center(
        child: Text("AddPost"),
      ),
    );
  }
}
