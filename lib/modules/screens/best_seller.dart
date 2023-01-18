import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/modules/screens/search/search_screen.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';

class BestSeller extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {

      },
      builder:  (context, state) {
        var cubit = ECommerceAppCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'bestSeller'.tr,


          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      navigateTo(context,ECommerceAppSearchScreen(isAdmin: false,));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: isDark1 ? defaultColor2 : Colors.grey[300] ,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children:   [
                            const Icon(
                              IconBroken.Search,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                'search'.tr
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1/1.58,
                      children: List.generate(ECommerceAppCubit.get(context).eCommerceProductModel!.products!.length,
                            (index) => buildGridProduct(ECommerceAppCubit.get(context).eCommerceProductModel!.products![index],context),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
