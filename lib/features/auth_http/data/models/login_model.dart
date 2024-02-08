class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({
    required this.token,
    required this.error,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json['token'] : "",
      error: json["error"] != null ? json['error'] : "",
    );
  }
}

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return ({
      'email': email.trim(),
      'password': password.trim(),
    });
  }
}
