import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/styles/colors.dart';

class AddToCartDialog extends StatelessWidget {

  late String text;
  late int product_id;
  late String cleaning_id;

  late Widget widget;

  AddToCartDialog({Key? key,required this.text,required this.widget,required this.product_id,required this.cleaning_id,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),

        content:  Container(
            width: double.maxFinite,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/Images/img_20.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'addCartMessage1'.tr,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5
                  ),
                ),
                Text(
                  'addCartMessage2'.tr,
                  style: const TextStyle(
                      fontSize:18,
                      height: 1.5
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
                  child: defaultButton(
                    text: 'continuation'.tr,
                    function: (){
                      Navigator.pop(context);
                      ECommerceAppCubit.get(context).addToCart(
                          product_id: product_id,
                          cleaning_id: cleaning_id,
                      );
                    },
                    width: double.infinity,
                    radius: 5,
                    background: defaultColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0,),
                  child: defaultButton(
                    text: 'backShopping'.tr,
                    function: (){
                      navigateTo(context, ECommerceLayoutScreen());
                    },
                    width: double.infinity,
                    radius: 5,
                    background: defaultColor,
                    isNonBackgroundColor: true,
                  ),
                ),


              ],
            )
        )

    );
  }
}
