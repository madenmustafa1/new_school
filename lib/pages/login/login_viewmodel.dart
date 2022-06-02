import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../model/login/user_model.dart';
import '../../service/login/login_repository.dart';
import '../../dependency_injection/setup.dart';
import '../../model/login/login_model.dart';
import '../../model/login/sign_up_model.dart';
import '../../util/constants.dart';

class LoginViewModel {
  Constants constants = getIt<Constants>();
  LoginRepository loginRepository = LoginRepository();

  Future<LoginControlModel> signIn(String email, String password) async {
    String errorDesc = "";
    try {
      UserModel userModel = await loginRepository.signIn(email, password);
      return LoginControlModel(
        message: constants.loginSuccessMessage,
        isSucces: true,
        userModel: userModel,
      );
    } on FirebaseAuthException catch (e) {
      errorDesc = e.code;
    } catch (e) {
      errorDesc = e.toString();
    }
    return LoginControlModel(
      message: errorDesc,
      isSucces: false,
    );
  }

  Future<LoginControlModel> signUp(SignUpModel signUpModel) async {
    String mail = signUpModel.mail.trim();
    String username = signUpModel.username.trim();
    String password = signUpModel.password.trim();
    String rePassword = signUpModel.rePassword.trim();

    if (mail.isEmpty) {
      return LoginControlModel(
          message: constants.errorMailMessage, isSucces: false);
    }
    if (!emailValidation(mail)) {
      return LoginControlModel(
        message: constants.errorMailValidationMessage,
        isSucces: false,
      );
    }

    if (username.isEmpty) {
      return LoginControlModel(
          message: constants.errorUsernameMessage, isSucces: false);
    }

    if (password.isEmpty) {
      return LoginControlModel(
          message: constants.errorPasswordMessage, isSucces: false);
    }

    if (rePassword.isEmpty) {
      return LoginControlModel(
        message: constants.errorPasswordMessage,
        isSucces: false,
      );
    }

    if (password != rePassword) {
      return LoginControlModel(
        message: constants.errorPasswordNotMatchMessage,
        isSucces: false,
      );
    }

    String errorDesc = "";
    bool isSuccess = true;
    UserModel? userModel;
    try {
      userModel = await loginRepository.signUp(signUpModel);
    } on FirebaseAuthException catch (e) {
      errorDesc = e.code;
      isSuccess = false;
      debugPrint(e.message);
    } catch (e) {
      debugPrint(e.toString());
      isSuccess = false;
      errorDesc = e.toString();
    }

    return LoginControlModel(
      message: isSuccess ? constants.loginSuccessMessage : errorDesc,
      isSucces: isSuccess,
      userModel: userModel,
    );

    //return LoginControlModel(message: "", isSucces: true);
  }

  bool emailValidation(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
