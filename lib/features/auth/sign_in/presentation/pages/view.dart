import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sq_app/core/utils/app_text_styles/extension.dart';
import 'package:sq_app/core/utils/extensions.dart';
import 'package:sq_app/di/service_locator.dart';

import '.../../../../../../../core/utils/sizedbox_extensions.dart';
import '../../../../../commonWidget/app_text.dart';
import '../../../../../commonWidget/button_animation/LoadingButton.dart';
import '../../../../../commonWidget/text_input.dart';
import '../../../../../gen/assets.gen.dart';
import '../controller/controller.dart';
import '../controller/state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController(text: "admin@admin.com");
  final passwordController = TextEditingController(text: "1234567");
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = sl<AuthCubit>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyAssets.icons.profilePicture1.image(
                width: 100,
                height: 100,
              ),
              MyTextApp(
                title: 'Login View',
                style: context.headlineSmall,
              ),
              50.verticalSpace,
              AppCustomForm(
                controller: emailController,
                hintText: 'Email',
                fieldType: FieldType.email,
                validator: (v) =>
                    v?.isEmpty == true ? 'Email cannot be empty' : null,
              ),
              18.verticalSpace,
              AppCustomForm(
                controller: passwordController,
                hintText: 'Password',
                fieldType: FieldType.password,
                validator: (v) =>
                    v?.isEmpty == true ? 'Password cannot be empty' : null,
              ),
              18.verticalSpace,
              BlocProvider(
                create: (context) => AuthCubit(),
                child: BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (previous, current) =>
                      previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    return LoadingButton(
                      title: 'Login',
                      onTap: () {
                        if (_formKey.currentState?.validate() != true) {
                          return;
                        }
                        controller.loginAdmin(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      },
                      isAnimating: state.isLoading,
                    );
                  },
                ),
              ),
            ],
          ),
        ).withPadding(horizontal: 16, top: context.padding.top),
      ),
    );
  }
}
