import 'package:get_it/get_it.dart';
// Controllers

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  _registerControllers();
}

_registerControllers() {
  // sl
  //   ..registerFactory<SplashController>(() => SplashController())
  //   ..registerFactory<LoginController>(() => LoginController())
  //   ..registerLazySingleton<NavigationBloc>(() => NavigationBloc())
  //   ..registerFactory<HomeController>(() => HomeController())
  //   ..registerFactory<CitiesBloc>(() => CitiesBloc())
  //   ..registerFactory<ExpansionTileCubit>(() => ExpansionTileCubit())
  //   ..registerLazySingleton<AppVersionController>(() => AppVersionController());
}
