import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_school/pages/login/sign_up_page.dart';
import '../dependency_injection/setup.dart';
import 'pages/login/sign_in_page.dart';
import '../util/constants.dart';

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: getIt<Constants>().appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/sign_up':
            return CupertinoPageRoute(
                builder: (_) => SignUpPage(), settings: settings);
        }
        return null;
      },
    );
  }
}
