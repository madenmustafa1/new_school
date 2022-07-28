import '/dependency_injection/setup.dart';
import '/model/home/post_model.dart';
import '/service/app/app_repository.dart';

class HomePageViewModel {
  AppRepository appRepository = getIt<AppRepository>();

  Future<List<PostModel>> showUserPostList() async {
    return await appRepository.showUserPostList("postModel");
  }
}
