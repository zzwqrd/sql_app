import 'package:get_it/get_it.dart';

import '../features/splash_view/presentation/controller/controller.dart';
// Controllers

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerFactory<SplashController>(() => SplashController());
}
