import 'package:new_school/model/home/post_model.dart';

import '/dependency_injection/setup.dart';
import '/service/app/app_repository.dart';

class AddPostViewModel {
  AppRepository appRepository = getIt<AppRepository>();

  void addPost(PostModel postModel) {
    appRepository.addPost(postModel);
  }
}
