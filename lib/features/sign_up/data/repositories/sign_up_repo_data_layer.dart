import 'package:dartz/dartz.dart';
import 'package:ecommerece_c8_final/core/error/failures.dart';
import 'package:ecommerece_c8_final/features/sign_up/data/data_sources/data_soureses.dart';
import 'package:ecommerece_c8_final/features/sign_up/data/models/signUpModel.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/entities/sign_up_data.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/repositories/sign_up_domain_repo.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSources sources;

  SignUpDataRepo(this.sources);

  @override
  Future<Either<Failures, SignUpModel>> signUp(SignUpData signUpData) =>
      sources.signUp(signUpData);
}
