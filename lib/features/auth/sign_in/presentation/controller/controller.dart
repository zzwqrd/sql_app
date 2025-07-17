import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sq_app/core/routes/app_routes_fun.dart';
import 'package:sq_app/core/routes/routes.dart';
import 'package:sq_app/core/utils/flash_helper.dart';

import '../../../../../core/database/db_helper.dart';
import 'state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  final DBHelper _db = DBHelper();

  AuthCubit() : super(AuthState.initial());

  // ---- مساعدات التشفير ----
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }

  bool _verifyPassword(String password, String hashedPassword) {
    return _hashPassword(password) == hashedPassword;
  }

  String _generateToken(String email) {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    return sha256.convert(utf8.encode('$email-$timestamp')).toString();
  }

  // ---- عمليات المصادقة ----
  Future<void> loginAdmin(String email, String password) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final admin = await _db
          .table('admins')
          .join('roles', 'admins.role_id', '=', 'roles.id')
          .select([
            'admins.*',
            'roles.name as role_name',
            'roles.display_name as role_display_name'
          ])
          .where('admins.email', email)
          .where('admins.is_active', 1)
          .first();

      if (admin == null) {
        ToastHelper().error(
          msg: 'خطأ في تسجيل الدخول',
          description: 'البريد الإلكتروني غير صحيح',
        );
        emit(state.copyWith(
          isLoading: false,
          error: 'البريد الإلكتروني غير صحيح',
        ));
        return;
      }

      if (admin['is_active'] == 0) {
        ToastHelper().error(
          msg: 'خطأ في تسجيل الدخول',
          description: 'هذا الحساب غير نشط',
        );
        emit(state.copyWith(
          isLoading: false,
          error: 'هذا الحساب غير نشط',
        ));
        return;
      }

      if (admin['is_verified'] == 0) {
        ToastHelper().error(
          msg: 'خطأ في تسجيل الدخول',
          description: 'هذا الحساب غير مفعل',
        );
        emit(state.copyWith(
          isLoading: false,
          error: 'هذا الحساب غير مفعل',
        ));
        return;
      }

      if (!_verifyPassword(password, admin['password_hash'])) {
        ToastHelper().error(
          msg: 'خطأ في تسجيل الدخول',
          description: 'كلمة المرور غير صحيحة',
        );
        emit(state.copyWith(
          isLoading: false,
          error: 'كلمة المرور غير صحيحة',
        ));
        return;
      }

      await _db
          .table('admins')
          .where('id', admin['id'])
          .update({'last_login_at': DateTime.now().toIso8601String()});

      // جلب الصلاحيات وإضافتها إلى بيانات المدير
      final permissions = await _getAdminPermissions(admin['id']);
      final accountData = {
        ...admin,
        'account_type': 'admin',
        'permissions': permissions
      };
      ToastHelper().success(
        msg: 'تم تسجيل الدخول بنجاح',
        description: 'مرحبًا ${admin['name']}',
      );
      pushAndRemoveUntil(NamedRoutes.i.home);
      emit(state.copyWith(
        isLoading: false,
        account: accountData,
        error: null,
      ));
    } catch (e) {
      ToastHelper().error(
        msg: 'خطأ في تسجيل الدخول',
        description: e.toString(),
      );
      emit(state.copyWith(
        isLoading: false,
        error: 'خطأ في تسجيل دخول المدير: $e',
      ));
    }
  }

  Future<void> loginUser(String email, String password) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final user = await _db
          .table('users')
          .where('email', email)
          .where('is_active', 1)
          .first();

      if (user == null) {
        emit(state.copyWith(
          isLoading: false,
          error: 'البريد الإلكتروني غير صحيح',
        ));
        return;
      }

      if (!_verifyPassword(password, user['password_hash'])) {
        emit(state.copyWith(
          isLoading: false,
          error: 'كلمة المرور غير صحيحة',
        ));
        return;
      }

      await _db
          .table('users')
          .where('id', user['id'])
          .update({'last_login_at': DateTime.now().toIso8601String()});

      emit(state.copyWith(
        isLoading: false,
        account: {...user, 'account_type': 'user'},
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'خطأ في تسجيل دخول المستخدم: $e',
      ));
    }
  }

  // ---- عمليات التسجيل والإنشاء ----
  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? phone,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final existingUser = await _db
          .table('users')
          .where('email', email)
          .orWhere('username', username)
          .first();

      if (existingUser != null) {
        emit(state.copyWith(
          isLoading: false,
          error: 'المستخدم موجود بالفعل',
        ));
        return;
      }

      final userId = await _db.table('users').insert({
        'username': username,
        'email': email,
        'password_hash': _hashPassword(password),
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'is_active': 1,
        'is_verified': 0,
      });

      emit(state.copyWith(
        isLoading: false,
        userId: userId,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'خطأ في تسجيل المستخدم: $e',
      ));
    }
  }

  Future<void> createAdmin({
    required String name,
    required String email,
    required String password,
    required int roleId,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final existingAdmin =
          await _db.table('admins').where('email', email).first();

      if (existingAdmin != null) {
        emit(state.copyWith(
          isLoading: false,
          error: 'المدير موجود بالفعل',
        ));
        return;
      }

      final role = await _db.table('roles').where('id', roleId).first();
      if (role == null) {
        emit(state.copyWith(
          isLoading: false,
          error: 'الدور غير موجود',
        ));
        return;
      }

      final adminId = await _db.table('admins').insert({
        'name': name,
        'email': email,
        'token': _generateToken(email),
        'password_hash': _hashPassword(password),
        'role_id': roleId,
        'is_active': 1,
      });

      emit(state.copyWith(
        isLoading: false,
        adminId: adminId,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'خطأ في إنشاء المدير: $e',
      ));
    }
  }

  // ---- إدارة الصلاحيات ----
  Future<void> loadPermissions(int adminId) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final permissions = await _getAdminPermissions(adminId);
      emit(state.copyWith(
        isLoading: false,
        permissions: permissions,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'خطأ في تحميل الصلاحيات: $e',
      ));
    }
  }

  Future<List<String>> _getAdminPermissions(int adminId) async {
    return await _db
        .table('admins')
        .join('roles', 'admins.role_id', '=', 'roles.id')
        .join('role_permissions', 'roles.id', '=', 'role_permissions.role_id')
        .join('permissions', 'role_permissions.permission_id', '=',
            'permissions.id')
        .select(['permissions.permission_name'])
        .where('admins.id', adminId)
        .where('permissions.is_active', 1)
        .pluck<String>('permission_name');
  }

  // ---- عمليات إدارة الحساب ----
  Future<void> changePassword({
    required String table,
    required int userId,
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(state.copyWith(isLoading: true, error: null, passwordChanged: false));
    try {
      final user = await _db.table(table).where('id', userId).first();
      if (user == null) {
        emit(state.copyWith(
          isLoading: false,
          error: 'المستخدم غير موجود',
        ));
        return;
      }

      if (!_verifyPassword(oldPassword, user['password_hash'])) {
        emit(state.copyWith(
          isLoading: false,
          error: 'كلمة المرور القديمة غير صحيحة',
        ));
        return;
      }

      await _db
          .table(table)
          .where('id', userId)
          .update({'password_hash': _hashPassword(newPassword)});

      emit(state.copyWith(
        isLoading: false,
        passwordChanged: true,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'خطأ في تغيير كلمة المرور: $e',
      ));
    }
  }

  void logout() {
    emit(AuthState.initial());
  }

  // ---- التخزين المحلي ----
  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      return AuthState(
        isLoading: json['isLoading'] ?? false,
        account: json['account'] != null
            ? Map<String, dynamic>.from(json['account'])
            : null,
        userId: json['userId'],
        adminId: json['adminId'],
        permissions: json['permissions'] != null
            ? List<String>.from(json['permissions'])
            : null,
        passwordChanged: json['passwordChanged'] ?? false,
        error: json['error'],
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {
      'isLoading': state.isLoading,
      'account': state.account,
      'userId': state.userId,
      'adminId': state.adminId,
      'permissions': state.permissions,
      'passwordChanged': state.passwordChanged,
      'error': state.error,
    };
  }
}
