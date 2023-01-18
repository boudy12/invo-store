import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/main.dart';
import 'package:invostore1/modules/screens/dialog/dialog.dart';
import 'package:invostore1/modules/screens/profile/profile_screen.dart';
import 'package:invostore1/shared/Bloc_Observer.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/shared/cubit/states.dart';
import 'package:invostore1/shared/network/local/cache_helper.dart';
import 'package:invostore1/shared/network/remote/dio_helper.dart';

import '../../styles/colors.dart';

class ECommerceAppSettingScreen extends StatelessWidget {
   ECommerceAppSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: defaultAppBar(
          context: context,
          title: 'setting'.tr,
        actions: [
          IconButton(
              onPressed: (){
                navigateTo(context, ECommerceLayoutScreen(isCart: true,));
              },
              icon: Icon(
                  Icons.shopping_cart_outlined
              )
          ),

          IconButton(
              onPressed: (){
                navigateTo(context, ProfileScreen());
              },
              icon: Icon(
                  Icons.person_outline_sharp
              )
          ),
        ]
      ),
      body: Directionality(
        textDirection: isArabic1? TextDirection.rtl : TextDirection.ltr,

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading:  const Icon(
                  Icons.person,
                  color:  Colors.blueGrey,
                ),
                title:  Text(
                  'profile'.tr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: ()=> navigateTo(context, ProfileScreen()),
              ),
              ListTile(
                leading:  const Icon(
                  Icons.language_outlined,
                  color:  Colors.blueGrey,
                ),
                title:  Text(
                  'changeLang'.tr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () {
                  showDialog(context: context,builder: (builder) =>BlurryDialog('changeLang'.tr));


                },
              ),
              ListTile(
                leading:  const Icon(
                  Icons.dark_mode_rounded,
                  color:  Colors.blueGrey,
                ),
                title: Row(
                  children: [

                    Text(
                        'darkMode'.tr,
                      style: Theme.of(context).textTheme.bodyText1,

                    ),
                    Spacer(),
                    Switch(
                        value: AppCubit.get(context).isDark,
                        onChanged: (state){
                          AppCubit.get(context).changeMode();
                        }
                    ),
                  ],
                ),
                onTap: () {
                  AppCubit.get(context).changeMode();

                },
              ),
              const Divider(),

            ],
          ),
        ),
      ),
    );

  }
}
