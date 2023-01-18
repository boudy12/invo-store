import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';



class BlurryDialog  extends StatelessWidget {
  final List locale = [
    {'name':'English','locale': Locale('en','US')},
    {'name':'العربية','locale': Locale('ar','AR')},
  ];
  String title;
  updateLanguage(Locale locale){
      //Get.back();
      Get.updateLocale(locale);
  }
  BlurryDialog(this.title,   {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      title: Text(title,),
      content:  Container(
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    print(locale[index]['name']);
                    updateLanguage(locale[index]['locale']);
                    if((isArabic1 == false && locale[index]['name'] == 'العربية') || (isArabic1 == true && locale[index]['name'] == 'English') )
                      {AppCubit.get(context).changeLanguage();}
                    // print(AppCubit.get(context).isArabic);
                    ECommerceAppCubit.get(context).getProduct();
                     showToast(
                         msg:  locale[index]['name'],
                         state: ToastStates.SUCCESS
                     );
                  },
                    child: Text(locale[index]['name'],)
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              color: Colors.blue,
              height: 2,
            ),
            itemCount: locale.length
        ),
      )

    );


  }
}
