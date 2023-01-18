import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/models/brands.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';

class CategorySliderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var cubit = ECommerceAppCubit.get(context).eCommerceCategoriesModel;
        return Container(
          height: 100,
          child: Row(
            children: [

              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildCategoriesItems(cubit!.products![index],index+1,context),
                    separatorBuilder:  (context, index) => const SizedBox(width: 10,),
                    itemCount: cubit!.products!.length
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
