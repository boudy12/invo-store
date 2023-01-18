import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/modules/login/login_screen.dart';
import 'package:invostore1/modules/screens/home/product_screen.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/network/local/cache_helper.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();


}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  late Timer timer;

  void submit(){
    navigateAndFinishSS(context, ECommerceLayoutScreen());
  }
  void autoPress(){
    timer = Timer(const Duration(seconds:7),(){
      submit();
    });
  }

  @override
  void initState() {
    ECommerceAppCubit.get(context).getProduct();
    autoPress();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:    [

            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: Container(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}

