import 'package:flutter/material.dart';
import 'package:new_school/widgets/basic_appbar.dart';

import '../../util/color_util.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "Add post"),
      body: const Center(
        child: Text("Add Post Page"),
      ),
    );
  }
}
