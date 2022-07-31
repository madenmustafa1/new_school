import 'package:flutter/material.dart';
import '/widgets/basic_appbar.dart';
import '/util/router.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "History"),
      body: const Center(
        child: Text("History Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addPost(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void addPost(BuildContext context) {
    Navigator.pushNamed(context, CRouter.ADD_POST);
  }
}
