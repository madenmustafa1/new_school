
import '/model/login/user_model.dart';
import '/model/home/post_model.dart';

abstract class AppServiceInterface {
    Future<bool> addPost(PostModel postModel);
    Future<List<PostModel>> showUserPostList(String userEmail);
    Future<UserModel?> getUserInfo(String userEmail);
}