import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_school/widgets/show_toast.dart';
import '../../util/router.dart';
import '../login/login_viewmodel.dart';
import '../../model/login/sign_up_model.dart';
import '../../dependency_injection/setup.dart';
import '../../model/login/login_model.dart';
import '../../util/app_util.dart';
import '../../util/color_util.dart';
import '../../util/constants.dart';
import '../../widgets/calc_sized_box.dart';
import '../../widgets/custom_rich_text.dart';
import '../../widgets/login_text_field.dart';
import '../../widgets/simple_button.dart';
import '../../widgets/simple_text.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController mailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  //LoginViewModel loginViewModel = LoginViewModel();

  Constants constants = getIt<Constants>();
  LoginViewModel loginViewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.MAIN_COLOR,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //App Name
              Padding(
                padding: EdgeInsets.only(
                  bottom: AppUtil.getHeight(context) / 14,
                ),
                child: SimpleText(
                  text: constants.appName,
                  textColor: ColorUtil.WHITE,
                ),
              ),
              //Mail
              LoginTextField(
                controller: mailController,
                hintText: constants.emailInputHintText,
              ),
              //Username
              LoginTextField(
                controller: usernameController,
                hintText: constants.usernameInputHintText,
              ),
              //Password
              LoginTextField(
                controller: passwordController,
                hintText: constants.passwordInputHintText,
                hideText: true,
              ),
              //Re-Password
              LoginTextField(
                controller: rePasswordController,
                hintText: constants.rePasswordInputHintText,
                hideText: true,
              ),
              const CalcSizedBox(calc: 150),
              //Login Button
              SimpleButton(
                buttonText: constants.signUpButtonText,
                onPressed: () {
                  signUp(context);
                },
              ),
              const CalcSizedBox(calc: 80),

              CustomRichText(
                firstText: constants.signUpText1,
                secondText: constants.signUpText2,
                secondTextColor: ColorUtil.WHITE,
                firstOptionalTextSize: 16,
                secondOptionalTextSize: 16,
                firstTextIsBold: true,
                secondTextIsBold: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUp(BuildContext context) async {
    SignUpModel signUpModel = SignUpModel(
      mail: mailController.text,
      username: usernameController.text,
      password: passwordController.text,
      rePassword: rePasswordController.text,
    );

    LoginControlModel result = await loginViewModel.signUp(signUpModel);
    if (result.isSucces) {
      Navigator.pushNamedAndRemoveUntil(
          context, CRouter.HOME, (route) => false);
    } else {
      ShowToast.errorToast(result.message);
    }
  }
}
