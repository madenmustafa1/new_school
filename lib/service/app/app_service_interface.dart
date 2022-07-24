
import '/model/home/post_model.dart';

abstract class AppServiceInterface {
    Future<bool> addPost(PostModel postModel);
}