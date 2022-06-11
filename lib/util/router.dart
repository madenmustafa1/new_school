// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:new_school/pages/add_post/add_post_page.dart';

import '../pages/home/home_page.dart';
import '../pages/login/sign_up_page.dart';

class CRouter {
  static String SIGN_UP = '/sign_up';
  static String HOME = '/home';
  static String ADD_POST = '/add_post';
  static String HOME_REMOVE_UNTIL = '/home_remove_until';

  static Route<dynamic>? customOnGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/sign_up':
        return CupertinoPageRoute(
          builder: (_) => SignUpPage(),
          settings: settings,
        );
      case '/home':
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case '/add_post':
        return CupertinoPageRoute(
          builder: (_) => const AddPostPage(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
    return null;
  }
}
