import 'package:bloc/bloc.dart';

import '../../../../core/routes/app_routes_fun.dart';
import '../../../../core/routes/routes.dart';
import 'state.dart';

class SplashController extends Cubit<SplashState> {
  SplashController() : super(SplashState.initial());

  void navigateToNextPage() {
    emit(state.copyWith(isLoading: true));
    final nextPage = NamedRoutes.i.login;
    Future.delayed(const Duration(seconds: 2), () {
      pushAndRemoveUntil(nextPage);

      emit(state.copyWith(isLoading: false));
    });
  }
}
