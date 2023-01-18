import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/modules/login/cubit/cubit.dart';
import 'package:invostore1/modules/login/cubit/states.dart';
import 'package:invostore1/modules/login/login_screen.dart';
import 'package:invostore1/modules/screens/profile/address_screen.dart';
import 'package:invostore1/modules/screens/profile/personal_profile_screen.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';
import 'package:like_button/like_button.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {

  ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
          context: context,
          title: 'Profile'.tr
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
         
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'hi'.tr,
                ),
                Text(
                  'Boudy',

                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                navigateTo(context, PersonalProfileScreen());
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'profile'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'manageProfile'.tr,
                          style: TextStyle(
                              fontSize: 12
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: (){
                        navigateTo(context, PersonalProfileScreen());
                      },
                      icon: Icon(
                        isArabic1 ? IconBroken.Arrow___Left_2  :IconBroken.Arrow___Right_2   ,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildSpacerLine2(),
            InkWell(
              onTap: (){
                navigateTo(context, AddressScreen());
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'addresses'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'manageAddresses'.tr,
                          style: TextStyle(
                              fontSize: 12
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: (){
                        navigateTo(context, AddressScreen());
                      },
                      icon: Icon(
                        isArabic1 ? IconBroken.Arrow___Left_2  :IconBroken.Arrow___Right_2   ,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildSpacerLine2(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
              child: defaultButton(
                  text: 'logout'.tr,
                  function: (){
                    signOutECommerce(context);
                  },
                  width: double.infinity,
                  radius: 5,
                  background: defaultColor
              ),
            )
          ],
        ),
      ),
    );
  }

}
