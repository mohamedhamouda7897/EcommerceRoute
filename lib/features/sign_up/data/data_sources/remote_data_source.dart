import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerece_c8_final/core/api/end_points.dart';
import 'package:ecommerece_c8_final/core/error/failures.dart';
import 'package:ecommerece_c8_final/core/utils/constants.dart';
import 'package:ecommerece_c8_final/features/sign_up/data/data_sources/data_soureses.dart';
import 'package:ecommerece_c8_final/features/sign_up/data/models/signUpModel.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/entities/sign_up_data.dart';

class RemoteDataSource implements SignUpDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, SignUpModel>> signUp(SignUpData signUpData) async {
    try {
      var response =
          await dio.post("${Constants.baseUrlApi}${EndPoints.signUp}", data: {
        "name": signUpData.name,
        "email": signUpData.email,
        "password": signUpData.password,
        "rePassword": signUpData.password,
        "phone": signUpData.phone
      });
      SignUpModel signUpModel = SignUpModel.fromJson(response.data);
      return Right(signUpModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
