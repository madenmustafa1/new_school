import 'package:flutter/material.dart';
import 'package:new_school/pages/login/login_viewmodel.dart';
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
                  login();
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
                  Navigator.pushNamed(context, '/sign_up');
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    var result = await loginViewModel.signIn(username, password);
  }
}
