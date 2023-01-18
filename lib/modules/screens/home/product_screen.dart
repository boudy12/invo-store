import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/models/brands.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/modules/login/cubit/cubit.dart';
import 'package:invostore1/modules/screens/best_seller.dart';
import 'package:invostore1/modules/screens/home/CarouselSlider.dart';
import 'package:invostore1/modules/screens/home/category_slider.dart';
import 'package:invostore1/modules/screens/home/highlights.dart';
import 'package:invostore1/modules/screens/search/search_screen.dart';
import 'package:invostore1/modules/screens/setting_screen.dart';
import 'package:invostore1/modules/screens/show_product.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/shared/cubit/states.dart';
import 'package:invostore1/shared/network/local/cache_helper.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';
import 'package:like_button/like_button.dart';

class ECommerceAppProductScreen extends StatelessWidget {
  ECommerceAppProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<ECommerceAppCubit, ECommerceAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ECommerceAppCubit.get(context);

            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: Image(
                            width: double.infinity,
                            image: AssetImage(
                              'assets/Images/img_18.png',
                            ),
                          ),
                        ),
                        CategorySliderScreen(),
                        Row(
                          children: [
                            HighLightsScreen(
                              first: 'best',
                              second: 'seller',
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                navigateTo(context, BestSeller());
                              },
                              child: Text(
                                'more'.tr,
                                style: TextStyle(
                                    fontSize: 18, color: HexColor('#17809E')),
                              ),
                            ),
                          ],
                        ),
                        ConditionalBuilder(
                          condition: state is! ECommerceAppGetProductLoadingState ,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1 / 1.58,
                              children: List.generate(
                                cubit.eCommerceProductModel!.products!.length,
                                (index) => buildGridProduct(
                                    cubit.eCommerceProductModel!
                                        .products![index],
                                    context),
                              ),
                            ),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
