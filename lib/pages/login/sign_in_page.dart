import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../util/router.dart';
import '../../model/login/login_model.dart';
import '../../widgets/show_toast.dart';
import '../login/login_viewmodel.dart';
import '../../widgets/calc_sized_box.dart';
import '../../widgets/custom_rich_text.dart';
import '../../widgets/login_text_field.dart';
import '../../dependency_injection/setup.dart';
import '../../util/app_util.dart';
import '../../util/color_util.dart';
import '../../util/constants.dart';
import '../../widgets/simple_button.dart';
import '../../widgets/simple_text.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  TextEditingController mailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reasswordController = TextEditingController();

  Constants constants = getIt<Constants>();
  LoginViewModel loginViewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    goToHomePage(context);

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
              //E-mail
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
              const CalcSizedBox(calc: 150),
              //Login Button
              SimpleButton(
                buttonText: getIt<Constants>().loginButtonText,
                onPressed: () {
                  login(context);
                },
              ),
              const CalcSizedBox(calc: 80),

              CustomRichText(
                firstText: constants.signInText1,
                secondText: constants.signInText2,
                secondTextColor: ColorUtil.WHITE,
                firstOptionalTextSize: 16,
                secondOptionalTextSize: 16,
                firstTextIsBold: true,
                secondTextIsBold: true,
                onPressed: () {
                  Navigator.pushNamed(context, CRouter.SIGN_UP);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    LoginControlModel result = await loginViewModel.signIn(username, password);

    if (result.isSucces) {
      Navigator.pushNamedAndRemoveUntil(
          context, CRouter.HOME, (route) => false);
    } else {
      ShowToast.errorToast(result.message);
    }
  }

  void goToHomePage(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        if (user != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, CRouter.HOME, (route) => false);
        }
      },
    );
  }
}
