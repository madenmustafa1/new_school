import 'package:firebase_auth/firebase_auth.dart';
import '/model/login/user_model.dart';
import '/model/home/post_model.dart';

import '/dependency_injection/setup.dart';
import '/service/app/app_repository.dart';

class AddPostViewModel {
  AppRepository appRepository = getIt<AppRepository>();

  Future<bool> addPost(PostModel postModel) async {
    if (FirebaseAuth.instance.currentUser == null) return false;
    if (FirebaseAuth.instance.currentUser!.email == null) return false;

    UserModel? userModel = await appRepository
        .getUserInfo(FirebaseAuth.instance.currentUser!.email!);
    if (userModel == null) return false;

    PostModel currentPostModel = PostModel(
        videoUrl: postModel.videoUrl,
        description: postModel.description,
        nameSurname: userModel.nameSurname!,
        profilePhotoUrl: userModel.profileUrl!,
        videoName: postModel.videoName,
        uuid: postModel.uuid,
        like: postModel.like,
        comment: postModel.comment,
        subject: postModel.subject,
        email: FirebaseAuth.instance.currentUser!.email!);

    return await appRepository.addPost(currentPostModel);
  }
}
