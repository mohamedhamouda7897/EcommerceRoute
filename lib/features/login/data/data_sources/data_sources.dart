import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerece_c8_final/core/error/failures.dart';
import 'package:ecommerece_c8_final/features/login/data/models/login_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/utils/constants.dart';

abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(String email, String password);
}

class RemoteLoginDataSource implements LoginDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, LoginModel>> login(
      String email, String password) async {
    try {
      var response =
          await dio.post("${Constants.baseUrlApi}${EndPoints.login}", data: {
        "email": email,
        "password": password,
      });
      // if (response.statusCode != 200 || response.statusCode != 201) {
      //   return Left(ServerFailures(response.data['message']));
      // }
      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class LocalLoginDataSource implements LoginDataSources {
  @override
  Future<Either<Failures, LoginModel>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
