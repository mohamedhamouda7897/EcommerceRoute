import 'package:dartz/dartz.dart';
import 'package:ecommerece_c8_final/core/error/failures.dart';
import 'package:ecommerece_c8_final/features/login/data/data_sources/data_sources.dart';
import 'package:ecommerece_c8_final/features/login/domain/entities/login_entity.dart';
import 'package:ecommerece_c8_final/features/login/domain/repositories/login_domain_repo.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSources loginDataSources;

  LoginDataRepo(this.loginDataSources);

  @override
  Future<Either<Failures, LoginEntity>> login(String email, String password) =>
      loginDataSources.login(email, password);
}
