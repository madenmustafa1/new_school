import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPostLoadingProvider =
    StateNotifierProvider<AddPostLoading, AddPostEnum>((ref) {
  return AddPostLoading(ref);
});

enum AddPostEnum {
  loading,
  success,
  error,
  idle,
}

class AddPostLoading extends StateNotifier<AddPostEnum> {
  AddPostLoading(this.ref) : super(AddPostEnum.idle);
  final Ref ref;

  void setLoadingState(AddPostEnum addPostEnum) => state = addPostEnum;
}
