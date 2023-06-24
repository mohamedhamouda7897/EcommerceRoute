import 'package:dartz/dartz.dart';
import 'package:ecommerece_c8_final/core/error/failures.dart';
import 'package:ecommerece_c8_final/features/sign_up/data/models/signUpModel.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/entities/sign_up_data.dart';

abstract class SignUpDataSources {
  Future<Either<Failures, SignUpModel>> signUp(SignUpData signUpData);
}
