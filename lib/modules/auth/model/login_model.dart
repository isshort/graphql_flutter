class LoginUser {
  LoginUser({required this.password, required this.username});

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        username: json['username'] as String,
        password: json['password'] as String,
      );

  final String username;
  final String password;
}
