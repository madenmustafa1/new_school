
import '/model/home/post_model.dart';

abstract class AppServiceInterface {
    Future<bool> addPost(PostModel postModel);
    Future<List<PostModel>> showUserPostList(String userEmail);
}