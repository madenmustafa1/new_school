import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/model/home/post_model.dart';

final userPostListProvider =
    StateNotifierProvider<UserPostListNotifier, List<PostModel>>((ref) {
  return UserPostListNotifier(ref);
});

class UserPostListNotifier extends StateNotifier<List<PostModel>> {
  UserPostListNotifier(this.ref) : super([]);
  final Ref ref;

  void setUserPostList(List<PostModel> userPostList) => state = userPostList;
}
