import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/admin/layout/cubit/cubit.dart';
import 'package:invostore1/admin/layout/cubit/states.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/modules/screens/profile/profile_screen.dart';
import 'package:invostore1/modules/screens/sidebar/sidebar_ecommerce_screen.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';



class ECommerceLayoutAdminScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppAdminCubit,ECommerceAppAdminStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = ECommerceAppAdminCubit.get(context);


        return Scaffold(

          drawerDragStartBehavior: DragStartBehavior.start,
          appBar: AppBar(
            title: Center(
              child: Text(
                cubit.title[cubit.currentIndex],
                style: TextStyle(
                  color: isDark1? Colors.white: Colors.blueGrey
                ),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                isArabic1 ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
              ),
            ),
            actions: [

              IconButton(
                  onPressed: (){
                    signOut(context);
                  },
                  icon: Icon(
                    Icons.logout,
                  )
              )
            ],
          ),
          body: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              displacement: 10,
              strokeWidth: 2,
              color: defaultColor,
              backgroundColor: Colors.white,

              onRefresh: () async {
             //   cubit.getProduct();
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
                  Icons.add,
                ),
                label:  'addProduct'.tr,
              ),
              BottomNavigationBarItem(
                icon:const Icon(
                  Icons.category_outlined,
                ),
                label: 'categories'.tr,
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



