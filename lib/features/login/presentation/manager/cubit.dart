import 'package:ecommerece_c8_final/features/login/data/repositories/login_data_repo.dart';
import 'package:ecommerece_c8_final/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerece_c8_final/features/login/domain/use_cases/login_use_case.dart';
import 'package:ecommerece_c8_final/features/login/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/data_sources.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginDataSources sources;

  LoginCubit(this.sources) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login() async {
    emit(LoginLoadingState());

    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);
    var result = await loginUseCase.call("habiba@gmail.com", "123@habiba");
    result.fold((l) {
      emit(LoginErrorState(l));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }
}
