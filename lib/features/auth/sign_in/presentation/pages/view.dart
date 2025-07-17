import 'package:flutter/material.dart';
import 'package:sq_app/core/utils/app_text_styles/extension.dart';
import 'package:sq_app/core/utils/extensions.dart';

import '.../../../../../../../core/utils/sizedbox_extensions.dart';
import '../../../../../commonWidget/app_text.dart';
import '../../../../../commonWidget/button_animation/LoadingButton.dart';
import '../../../../../commonWidget/text_input.dart';
import '../../../../../gen/assets.gen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              controller: TextEditingController(),
              hintText: 'Email',
              fieldType: FieldType.email,
              validator: (v) =>
                  v?.isEmpty == true ? 'Email cannot be empty' : null,
            ),
            18.verticalSpace,
            AppCustomForm(
              controller: TextEditingController(),
              hintText: 'Password',
              fieldType: FieldType.password,
              validator: (v) =>
                  v?.isEmpty == true ? 'Password cannot be empty' : null,
            ),
            18.verticalSpace,
            LoadingButton(
              title: 'Login',
              onTap: () {},
              isAnimating: false,
            ),
          ],
        ),
      ).withPadding(horizontal: 16, vertical: 24),
    );
  }
}
