import 'package:dartz/dartz.dart';
import 'package:ecommerece_c8_final/core/error/failures.dart';
import 'package:ecommerece_c8_final/features/home/data/data_sources/home_data_sources.dart';
import 'package:ecommerece_c8_final/features/home/domain/entities/CategoryEntity.dart';
import 'package:ecommerece_c8_final/features/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo(this.homeDataSources);

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands() =>
      homeDataSources.getBrands();

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories() =>
      homeDataSources.getCategories();
}
