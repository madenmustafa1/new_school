import '/model/home/post_model.dart';
import 'app_service.dart';
import 'app_service_interface.dart';

class AppRepository extends AppServiceInterface {
  final AppService _appService = AppService();

  @override
  Future<bool> addPost(PostModel postModel) async {
    return await _appService.addPost(postModel);
  }
}
