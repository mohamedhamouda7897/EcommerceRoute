import 'package:ecommerece_c8_final/features/home/presentation/pages/home.dart';
import 'package:ecommerece_c8_final/features/login/data/data_sources/data_sources.dart';
import 'package:ecommerece_c8_final/features/login/domain/entities/login_entity.dart';
import 'package:ecommerece_c8_final/features/login/presentation/manager/cubit.dart';
import 'package:ecommerece_c8_final/features/login/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/sign_up/presentation/pages/sign_up.dart';

class Routes {
  static const String login = "/";
  static const String signUp = "signUp";
  static const String home = "home";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => LoginCubit(RemoteLoginDataSource()),
              child: const LoginScreen()),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.home:
        // Map<String,dynamic> args=routeSettings.arguments as Map<String,dynamic>;
        LoginEntity loginEntity = routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(
          builder: (context) => HomeScreen(loginEntity),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() => const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Center(child: Text("Undefine Route"))],
        ),
      );
}
