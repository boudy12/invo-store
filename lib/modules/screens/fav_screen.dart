import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';
import 'package:like_button/like_button.dart';

import '../../shared/cubit/cubit.dart';

class ECommerceAppFavScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = ECommerceAppCubit.get(context).eCommerceAppGetFavModel;
        return ConditionalBuilder(
          condition: state is! ECommerceAppLoadingFavoritesState,
          builder:(context) => ListView.separated(
              itemBuilder: (context, index) => buildListItem(cubit!.data![index],context,isFav: true),
              separatorBuilder: (context, index) => buildSpacerLine(),
              itemCount: cubit!.data!.length
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );

  }

}
