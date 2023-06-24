import 'package:dartz/dartz.dart';
import 'package:ecommerece_c8_final/core/error/failures.dart';

import '../models/CategoryModel.dart';

abstract class HomeDataSources {
  Future<Either<Failures, CategoryOrBrandModel>> getCategories();

  Future<Either<Failures, CategoryOrBrandModel>> getBrands();
}
