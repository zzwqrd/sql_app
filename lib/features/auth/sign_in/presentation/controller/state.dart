import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final Map<String, dynamic>? account;
  final int? userId;
  final int? adminId;
  final List<String>? permissions;
  final bool passwordChanged;
  final String? error;

  const AuthState({
    this.isLoading = false,
    this.account,
    this.userId,
    this.adminId,
    this.permissions,
    this.passwordChanged = false,
    this.error,
  });

  // الحالة الأولية
  factory AuthState.initial() => const AuthState();

  // copyWith لتحديث الحالة
  AuthState copyWith({
    bool? isLoading,
    Map<String, dynamic>? account,
    int? userId,
    int? adminId,
    List<String>? permissions,
    bool? passwordChanged,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      account: account ?? this.account,
      userId: userId ?? this.userId,
      adminId: adminId ?? this.adminId,
      permissions: permissions ?? this.permissions,
      passwordChanged: passwordChanged ?? this.passwordChanged,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        account,
        userId,
        adminId,
        permissions,
        passwordChanged,
        error,
      ];
}
