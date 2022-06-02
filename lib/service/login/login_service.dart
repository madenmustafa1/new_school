import 'package:new_school/model/login/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_school/model/login/user_model.dart';
import 'package:new_school/service/login/login_base.dart';

class LoginService extends LoginBase {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<UserModel> signIn(String email, String password) async {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;

    UserModel userModel = UserModel(
      mail: user.email!,
      userUUID: user.uid,
      emailVerified: user.emailVerified,
    );

    return userModel;
  }

  @override
  Future<UserModel> signUp(SignUpModel signUpModel) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: signUpModel.mail, password: signUpModel.password);
    final User user = result.user!;

    UserModel userModel = UserModel(
      mail: user.email!,
      userUUID: user.uid,
      emailVerified: user.emailVerified,
    );

    return userModel;
  }
}
