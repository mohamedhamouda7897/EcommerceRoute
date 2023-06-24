import 'package:ecommerece_c8_final/core/error/failures.dart';

import '../../domain/entities/login_entity.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginEntity loginEntity;

  LoginSuccessState(this.loginEntity);
}

class LoginErrorState extends LoginStates {
  Failures failures;

  LoginErrorState(this.failures);
}
