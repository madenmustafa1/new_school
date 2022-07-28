import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '/riverpod/home_page_provider.dart';
import '/dependency_injection/setup.dart';
import '/pages/home/home_page_viewmodel.dart';
import '/model/home/post_model.dart';
import '/widgets/video/accordion_video.dart';

// ignore: must_be_immutable
class PostListView extends ConsumerWidget {
  PostListView({
    Key? key,
  }) : super(key: key);

  String url =
      "https://firebasestorage.googleapis.com/v0/b/new-school--app.appspot.com/o/123.png?alt=media&token=7d8d6dba-6a56-43dd-a1bc-8cec59e7c263";

  HomePageViewModel homePageViewModel = getIt<HomePageViewModel>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PostModel> watchUserPostModelList = ref.watch(userPostListProvider);
    userPostList(ref, false);

    return Expanded(
      child: ListView.builder(
        //physics: const NeverScrollableScrollPhysics(), //<--here
        shrinkWrap: true,
        itemCount: watchUserPostModelList.length,
        itemBuilder: (BuildContext context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: watchUserPostModelList.length,
            duration: const Duration(milliseconds: 500),
            columnCount: 1,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: AccordionVideo(
                postModel: PostModel(
                  videoUrl: watchUserPostModelList[index].videoUrl,
                  description: watchUserPostModelList[index].description,
                  nameSurname: watchUserPostModelList[index].nameSurname,
                  profilePhotoUrl: url,
                  videoName: watchUserPostModelList[index].videoName,
                  uuid: watchUserPostModelList[index].uuid,
                  like: index * 2,
                  comment: [],
                  subject: watchUserPostModelList[index].subject,
                  email: watchUserPostModelList[index].email,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void userPostList(WidgetRef ref, bool forceRequest) async {
    if (forceRequest) {
      setState(ref, await homePageViewModel.showUserPostList());
    } else if (ref.read(userPostListProvider).isEmpty) {
      setState(ref, await homePageViewModel.showUserPostList());
    }
  }

  void setState(WidgetRef ref, List<PostModel> data) {
    ref.read(userPostListProvider.notifier).setUserPostList(data);
  }
}
