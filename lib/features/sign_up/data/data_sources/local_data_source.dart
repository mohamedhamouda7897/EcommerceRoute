import 'package:dartz/dartz.dart';
import 'package:ecommerece_c8_final/core/error/failures.dart';
import 'package:ecommerece_c8_final/features/sign_up/data/models/signUpModel.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/entities/sign_up_data.dart';

import 'data_soureses.dart';

class LocalDataSource implements SignUpDataSources {
  @override
  Future<Either<Failures, SignUpModel>> signUp(SignUpData signUpData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
