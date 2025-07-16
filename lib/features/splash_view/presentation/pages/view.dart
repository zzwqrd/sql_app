import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sq_app/di/service_locator.dart';

import '../controller/controller.dart';
import '../controller/state.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<SplashController>()..navigateToNextPage();
    return BlocConsumer<SplashController, SplashState>(
      bloc: controller,
      buildWhen: (p, c) => p.isLoading == c.isLoading,
      listener: (context, state) => {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                Text(
                  'Loading...',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
