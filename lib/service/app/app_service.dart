import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_school/model/login/user_model.dart';

import '/model/home/post_model.dart';
import 'app_service_interface.dart';

class AppService extends AppServiceInterface {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> addPost(PostModel postModel) async {
    CollectionReference addPostReference =
        FirebaseFirestore.instance.collection('user_posts');

    bool isSuccess = false;
    await addPostReference
        .add(postModel.asMap())
        .then((value) => isSuccess = true)
        .catchError((error) => isSuccess = true);

    return isSuccess;
  }

  @override
  Future<List<PostModel>> showUserPostList(String userEmail) async {
    final data = await firestore.collection("user_posts").get();

    List<PostModel> dataList =
        data.docs.map((e) => PostModel.fromJson(e.data())).toList();
    return dataList;
  }

  @override
  Future<UserModel?> getUserInfo(String userEmail) async {
    var futureUser = await FirebaseFirestore.instance
        .collection('users')
        .limit(1)
        .where('mail', isEqualTo: userEmail)
        .get();

    UserModel? userModel;
    for (var user in futureUser.docs) {
      userModel = UserModel.fromJson(user.data());
    }

    return userModel;
  }
}
