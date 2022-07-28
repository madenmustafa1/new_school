import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_school/model/home/post_model.dart';

import '/dependency_injection/setup.dart';
import '/service/app/app_repository.dart';

class AddPostViewModel {
  AppRepository appRepository = getIt<AppRepository>();

  Future<bool> addPost(PostModel postModel) async {
    if (FirebaseAuth.instance.currentUser == null) return false;
    if (FirebaseAuth.instance.currentUser!.email == null) return false;
    /*
    Kullanıcının hesap bilgileri db'den çekilecek.
    PostModel currentPostModel = PostModel(
        videoUrl: postModel.videoUrl,
        description: postModel.description,
        nameSurname: postModel.nameSurname,
        profilePhotoUrl: postModel.profilePhotoUrl,
        videoName: postModel.videoName,
        uuid: postModel.uuid,
        like: postModel.like,
        comment: postModel.comment,
        subject: postModel.subject,
        email: FirebaseAuth.instance.currentUser!.email!);
    */

    return await appRepository.addPost(postModel);
  }
}
