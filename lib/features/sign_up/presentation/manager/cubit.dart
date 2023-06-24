import 'package:ecommerece_c8_final/features/sign_up/data/data_sources/data_soureses.dart';
import 'package:ecommerece_c8_final/features/sign_up/data/repositories/sign_up_repo_data_layer.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/entities/sign_up_data.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/repositories/sign_up_domain_repo.dart';
import 'package:ecommerece_c8_final/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:ecommerece_c8_final/features/sign_up/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpDataSources sources;

  SignUpCubit(this.sources) : super(SignUpInitState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void signUp() async {
    emit(SignUpLoadingState());
    SignUpData data =
        SignUpData("Habiba", "01112525254", "habiba@gmail.com", "123@habiba");
    SignUpDomainRepo signUpDomainRepo = SignUpDataRepo(sources);
    SignUpUseCase signUpUseCase = SignUpUseCase(signUpDomainRepo);
    var result = await signUpUseCase.call(data);

    result.fold((l) {
      emit(SignUpErrorState(l));
    }, (r) {
      emit(SignUpSuccessState(r));
    });
  }
}
