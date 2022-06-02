import 'package:get_it/get_it.dart';
import '../pages/login/login_viewmodel.dart';
import '../service/login/login_repository.dart';
import '../util/constants.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Constants>(() => Constants());

  getIt.registerFactory<LoginViewModel>(() => LoginViewModel());
  getIt.registerFactory<LoginRepository>(() => LoginRepository());
}
