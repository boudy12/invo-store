import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/styles/colors.dart';

class WhoAreWe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
          context: context,
        title: 'whoAreWe'.tr,

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              child: Stack(
                children: [
                  const Center(
                    child: Image(
                      width: double.infinity,
                      image: AssetImage(
                        'assets/Images/img_14.png',
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.6)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'whoAreWe'.tr,
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        Text(
                          'emiratesFish'.tr,
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        defaultButton(
                            function:(){
                              navigateTo(context, ECommerceLayoutScreen());
                            },
                            text: 'shopNow'.tr,
                            radius: 10,
                            background: defaultColor,
                            isUpperCase: true,
                            width: 125
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    'ourStory'.tr,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15.0,bottom: 20),
                    child: Text(
                      'message7'.tr,
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                  Text(
                    'message8'.tr,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
