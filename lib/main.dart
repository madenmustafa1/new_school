import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_page/main_page.dart';
import 'dependency_injection/setup.dart';
import 'pages/login/sign_in_page.dart';
import 'util/constants.dart';
import 'util/router.dart';

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
      home: userControl(),
      onGenerateRoute: CRouter.customOnGenerateRoute,
    );
  }

  Widget userControl() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return const MainPage();
    } else {
      return SignInPage();
    }
  }
}
