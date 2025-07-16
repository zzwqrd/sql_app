import 'package:flutter/material.dart';

import '../../features/auth/sign_in/presentation/pages/view.dart';
import '../../features/splash_view/presentation/pages/view.dart';
import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();
  String initial = NamedRoutes.i.splash;
  AppRoutes._internal();
  Map<String, Widget Function(BuildContext context)> appRoutes = {
    NamedRoutes.i.splash: (context) => const SplashView(),
    NamedRoutes.i.login: (context) => const LoginView(),
  };
}
