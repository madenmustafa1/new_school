import 'package:new_school/model/home/post_model.dart';

import '/dependency_injection/setup.dart';
import '/service/app/app_repository.dart';

class AddPostViewModel {
  AppRepository appRepository = getIt<AppRepository>();

  Future<bool> addPost(PostModel postModel) async {
     return await appRepository.addPost(postModel);
  }
}
