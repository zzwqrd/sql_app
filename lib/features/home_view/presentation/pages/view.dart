import 'package:flutter/material.dart';
import 'package:sq_app/di/service_locator.dart';

import '../../../auth/sign_in/presentation/controller/controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    final authCubit = sl<AuthCubit>();
    final account = authCubit.state.account;

    if (account != null && account['account_type'] == 'admin') {
      final adminId = account['id'] as int;
      authCubit.loadPermissions(adminId);
    }
  }

  final Set<String> _adminPermissions = {};

  bool _hasPermission(String permission) {
    final isAdmin = sl<AuthCubit>().state.account;

    if (isAdmin!['role_name'] == 'super_admin') {
      return true;
    }
    return _adminPermissions.contains(permission);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_hasPermission('products.view'))
            Center(
              child: Text(
                'Welcome Admin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
