import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/modules/screens/profile/profile_screen.dart';
import 'package:invostore1/modules/screens/sidebar/sidebar_ecommerce_screen.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/styles/icon_broken.dart';

import '../styles/colors.dart';


class ECommerceLayoutScreen extends StatelessWidget {
  bool? isCart = false;

  ECommerceLayoutScreen({Key? key,this.isCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = ECommerceAppCubit.get(context);
         if(isCart == true) {
           cubit.currentIndex=3 ;

           isCart = false;
         }

        return Scaffold(
          drawer: ECommerceSideBarScreen(),
          drawerDragStartBehavior: DragStartBehavior.start,
          appBar: AppBar(

            actions: [
              IconButton(
                  onPressed: (){
                    cubit.changeBottomNavBar(3);
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
            ],
          ),
          body: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              displacement: 10,
              strokeWidth: 2,
              color: defaultColor,
              backgroundColor: Colors.white,

              onRefresh: () async {
                cubit.getProduct();
                cubit.getCarts();
              },
              child: cubit.screen[cubit.currentIndex]),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon:const Icon(
                  IconBroken.Home,
                ),
                label: 'home'.tr,
              ),
              BottomNavigationBarItem(
                icon:const Icon(
                  Icons.category_outlined,
                ),
                label: 'categories'.tr,
              ),
              BottomNavigationBarItem(
                icon:const Icon(
                  IconBroken.Heart,
                ),
                label:  'favorites'.tr,
              ),
              BottomNavigationBarItem(
                icon:const Icon(
                    Icons.shopping_cart_outlined
                ),
                label: 'carts'.tr,
              ),

            ],
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}



