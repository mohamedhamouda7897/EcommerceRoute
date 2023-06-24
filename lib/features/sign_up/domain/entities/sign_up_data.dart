import 'package:equatable/equatable.dart';

class SignUpData extends Equatable {
  String name;
  String phone;
  String email;
  String password;

  SignUpData(this.name, this.phone, this.email, this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [name, phone, email, password];
}
