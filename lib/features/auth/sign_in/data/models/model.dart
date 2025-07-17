class AuthModel {
  final int id;
  final String username;
  final String email;
  final String passwordHash;
  final bool isActive;
  final bool isVerified;
  final String? firstName;
  final String? lastName;
  final String? phone;

  AuthModel({
    required this.id,
    required this.username,
    required this.email,
    required this.passwordHash,
    required this.isActive,
    required this.isVerified,
    this.firstName,
    this.lastName,
    this.phone,
  });

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      passwordHash: map['password_hash'],
      isActive: map['is_active'],
      isVerified: map['is_verified'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password_hash': passwordHash,
      'is_active': isActive,
      'is_verified': isVerified,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
    };
  }
}
