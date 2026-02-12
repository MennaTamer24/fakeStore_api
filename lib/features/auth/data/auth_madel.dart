class AuthModel {
  final String username;
  final String password;

  AuthModel({required this.username, required this.password});

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
