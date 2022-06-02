import '../../model/login/sign_up_model.dart';
import '../../model/login/user_model.dart';

abstract class LoginBase {
  Future<UserModel> signIn(String email, String password);
  Future<UserModel> signUp(SignUpModel signUpModel);
}
