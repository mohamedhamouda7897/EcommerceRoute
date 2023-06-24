import 'package:ecommerece_c8_final/features/sign_up/domain/entities/SignUpEntity.dart';

class SignUpModel extends SignUpEntity {
  String message;

  SignUpModel(
      {required this.message, required UserModel user, required String token})
      : super(user: user, token: token);

  SignUpModel.fromJson(Map<String, dynamic> json)
      : this(
          token: json['token'],
          message: json['message'],
          user: UserModel.fromJon(json['user']),
        );
}

class UserModel extends User {
  String role;

  UserModel({required this.role, required String name, required String email})
      : super(email: email, name: name);

  UserModel.fromJon(Map<String, dynamic> json)
      : this(
          name: json['name'],
          role: json['role'],
          email: json['email'],
        );
}
