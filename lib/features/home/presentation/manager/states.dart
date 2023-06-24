import '../../../../core/error/failures.dart';
import '../../domain/entities/CategoryEntity.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeGetCategoriesLoadingState extends HomeStates {}

class HomeGetBrandsLoadingState extends HomeStates {}

class HomeGetCategoriesSuccessState extends HomeStates {
  CategoryOrBrandEntity model;

  HomeGetCategoriesSuccessState(this.model);
}

class HomeGetCategoriesErrorState extends HomeStates {
  Failures failures;

  HomeGetCategoriesErrorState(this.failures);
}

class HomeGetBrandsSuccessState extends HomeStates {
  CategoryOrBrandEntity model;

  HomeGetBrandsSuccessState(this.model);
}

class HomeGetBrandsErrorState extends HomeStates {
  Failures failures;

  HomeGetBrandsErrorState(this.failures);
}
