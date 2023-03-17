// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.error,
    required this.token,
    required this.user,
    required this.rol,
  });

  String error;
  String token;
  String user;
  String rol;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    error: json["error"],
    token: json["token"],
    user: json["user"],
    rol: json["rol"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "token": token,
    "user": user,
    "rol": rol,
  };
}
