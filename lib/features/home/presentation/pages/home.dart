import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerece_c8_final/features/home/presentation/manager/cubit.dart';
import 'package:ecommerece_c8_final/features/home/presentation/manager/states.dart';
import 'package:ecommerece_c8_final/features/login/domain/entities/login_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/data_sources/remote_dto.dart';

class HomeScreen extends StatelessWidget {
  LoginEntity loginEntity;

  HomeScreen(this.loginEntity);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteDto())..getCategories(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("Route")),
            body: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(height: 200.h),
                  items: HomeCubit.get(context).sliders.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 398.w,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: Image.asset(i),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 280.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: HomeCubit.get(context).categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(HomeCubit.get(context)
                                    .categories[index]
                                    .image ??
                                "")),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
