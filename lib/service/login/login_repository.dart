import '../../model/login/sign_up_model.dart';
import '../../service/login/login_base.dart';
import '../../model/login/user_model.dart';
import 'login_service.dart';

class LoginRepository extends LoginBase {
  final LoginService _loginService = LoginService();

  @override
  Future<UserModel> signIn(String email, String password) async {
    return await _loginService.signIn(email, password);
  }

  @override
  Future<UserModel> signUp(SignUpModel signUpModel) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
