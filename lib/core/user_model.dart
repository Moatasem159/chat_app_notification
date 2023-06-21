class UserModel{
  final String token;
  final String email;
  final String password;
  UserModel({required this.token, required this.email, required this.password});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        token: json["token"],
        email: json["email"],
        password: json["password"],
      );
  Map<String, dynamic> toJson() =>
      {
        "name": token,
        "email": email,
        "password": password,
      };
}