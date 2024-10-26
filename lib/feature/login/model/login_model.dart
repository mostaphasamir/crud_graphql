class LoginModel {
  final String typename;
  final LoginData login;

  LoginModel({
    required this.typename,
    required this.login,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    typename: json["__typename"],
    login: LoginData.fromJson(json["login"]),
  );

}

class LoginData {
  final User user;
  final String token;

  LoginData({
    required this.user,
    required this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

}

class User {
  final String username;
  final bool active;
  final int id;

  User({
    required this.username,
    required this.active,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    active: json["active"],
    id: json["id"],
  );

}
