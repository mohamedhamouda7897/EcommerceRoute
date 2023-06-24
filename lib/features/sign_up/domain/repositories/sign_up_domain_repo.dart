import 'package:dartz/dartz.dart';
import 'package:ecommerece_c8_final/core/error/failures.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/entities/SignUpEntity.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/entities/sign_up_data.dart';

abstract class SignUpDomainRepo {
  Future<Either<Failures, SignUpEntity>> signUp(SignUpData signUpData);
}
