import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:invostore1/modules/screens/setting_screen.dart';
import 'package:invostore1/modules/screens/sidebar/delivery_And_Return_Policy.dart';
import 'package:invostore1/modules/screens/sidebar/fish_spices.dart';
import 'package:invostore1/modules/screens/sidebar/fresh_Fish.dart';
import 'package:invostore1/modules/screens/sidebar/special_Fish_Boxes.dart';
import 'package:invostore1/modules/screens/sidebar/who_Are_we.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/shared/cubit/states.dart';
import 'package:invostore1/styles/colors.dart';

class ECommerceSideBarScreen extends StatefulWidget {

  @override
  State<ECommerceSideBarScreen> createState() => _ECommerceSideBarScreenState();
}

class _ECommerceSideBarScreenState extends State<ECommerceSideBarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){} ,
      builder:  (context, state){
        var cubit = AppCubit.get(context);
        return Drawer(
          backgroundColor: cubit.isDark? HexColor("#161515"): Colors.white ,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/Images/shop.jpg',
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  )
              ),

              ListTile(

                title: Center(child: Text('home'.tr)),
                onTap: ()=> Navigator.pop(context),
              ),

              ListTile(
                title: Center(child: Text('specialFishBoxes'.tr)),
                onTap: ()=> navigateTo(context, SpecialFishBoxes()),
              ),
              // ListTile(
              //   title: Center(child: Text('freshFish'.tr)),
              //   onTap: ()=> navigateTo(context, FreshFish()),
              // ),
              // ListTile(
              //   title: Center(child: Text('fishSpices'.tr)),
              //   onTap: ()=> navigateTo(context, FishSpices()),
              // ),
              ListTile(
                title: Center(child: Text('deliveryAndReturnPolicy'.tr)),
                onTap: ()=> navigateTo(context, DeliveryAndReturnPolicy()),
              ),
              ListTile(
                title: Center(child: Text('whoAreWe'.tr)),
                onTap: ()=> navigateTo(context, WhoAreWe()),
              ),
              ListTile(
                title: Center(child: Text('setting'.tr)),
                onTap: ()=> navigateTo(context, ECommerceAppSettingScreen()),
              ),


              const Divider(),
              ListTile(

                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: HexColor('#17809E'),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'logout'.tr,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                onTap: ()=> signOutECommerce(context),
              ),
            ],
          ),
        );
      }
    );
  }
}
