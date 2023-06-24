import 'package:ecommerece_c8_final/features/home/data/data_sources/home_data_sources.dart';
import 'package:ecommerece_c8_final/features/home/data/repositories/home_data_repo.dart';
import 'package:ecommerece_c8_final/features/home/domain/entities/CategoryEntity.dart';
import 'package:ecommerece_c8_final/features/home/domain/repositories/home_domain_repo.dart';
import 'package:ecommerece_c8_final/features/home/domain/use_cases/get_brands_use_case.dart';
import 'package:ecommerece_c8_final/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:ecommerece_c8_final/features/home/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_assets.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSources) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  List<DataEntity> categories = [];
  List<String> sliders = [
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree
  ];

  void getBrands() async {
    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  void getCategories() async {
    emit(HomeGetCategoriesLoadingState());
    HomeDomainRepo homeDomainRepo = HomeDataRepo(homeDataSources);
    GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesUseCase(homeDomainRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategoriesSuccessState(r));
    });
  }
}
