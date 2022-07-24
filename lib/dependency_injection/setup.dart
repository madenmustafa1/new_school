import 'package:get_it/get_it.dart';
import '/service/app/app_repository.dart';
import '/widgets/widget_util.dart';
import '/pages/add_post/add_post_view_mode.dart';
import '/pages/login/login_viewmodel.dart';
import '/service/login/login_repository.dart';
import '/util/constants.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Constants>(() => Constants());
  getIt.registerLazySingleton<WidgetUtil>(() => WidgetUtil());

  getIt.registerFactory<LoginViewModel>(() => LoginViewModel());
  getIt.registerFactory<LoginRepository>(() => LoginRepository());

  getIt.registerFactory<AddPostViewModel>(() => AddPostViewModel());
  getIt.registerFactory<AppRepository>(() => AppRepository());
}
