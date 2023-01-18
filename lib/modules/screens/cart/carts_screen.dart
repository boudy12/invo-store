import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/modules/screens/cart/checkout_screen.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/styles/colors.dart';

class ECommerceAppCartScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var cubit = ECommerceAppCubit.get(context);
        return Scaffold(
          body: ConditionalBuilder(
            condition: true,
            builder:(context) => SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                      shrinkWrap: state is! ShopAppLoadingCartsState,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildListCartItem(context,index: index,cartModel: cubit.eCommerceCartModel!.items![index]),
                      separatorBuilder: (context, index) => buildSpacerLine(),
                      itemCount:cubit.eCommerceCartModel!.items!.length
                  ),
                ],
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          ),
          persistentFooterButtons: [
            +Column(
              children: [
                Row(
                  children: [
                    Text(
                      '${cubit.eCommerceCartModel!.price}',

                    ),
                    SizedBox(width: 5,),
                    Text(
                      'total'.tr,
                    ),
                  ],
                ),
                defaultButton(
                    function:(){
                      navigateTo(context, CheckoutScreen());
                    },
                    text: 'paying'.tr,
                    radius: 5,
                    background: defaultColor,
                    isUpperCase: false,
                    width: 250
                ),
              ],
            ),
          ],
        );
      },

    );
  }
}