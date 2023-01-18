import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/modules/login/cubit/cubit.dart';
import 'package:invostore1/modules/login/cubit/states.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';

class PersonalProfileScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {

      },
      builder:  (context, state) {

        var cubit = ECommerceAppCubit.get(context);

        print(cubit.eCommerceAppProfileModel!.data);
        nameController.text = cubit.eCommerceAppProfileModel!.data!.name!;
        emailController.text = cubit.eCommerceAppProfileModel!.data!.email!;
        phoneController.text = cubit.eCommerceAppProfileModel!.data!.phone!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                isArabic1 ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
              ),
            ),
            title: Text(
              'profile'.tr,
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  defaultFormFieldWithStyle(
                      context: context,
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (value){
                        if(value!.isEmpty)
                        {
                          return 'nameVerify'.tr;
                        }
                        return null;
                      },
                      onTap: () {},
                      text:  'name'.tr,
                      prefixIcon: Icons.person_outline
                  ),
                  const SizedBox(height: 15,),
                  defaultFormFieldWithStyle(
                      context: context,
                      controller: phoneController,
                      type: TextInputType.number,
                      validate: (value){
                        if(value!.isEmpty)
                        {
                          return 'phoneVerify'.tr;
                        }
                        return null;
                      },
                      onTap: () {},
                      text:  'phone'.tr,
                      prefixIcon: Icons.phone
                  ),
                  const SizedBox(height: 15,),
                  defaultFormFieldWithStyle(
                      context: context,
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value){
                        if(value!.isEmpty)
                        {
                          return 'emailVerify'.tr;
                        }
                        return null;
                      },
                      onTap: () {},
                      text: 'email'.tr,
                      prefixIcon:  Icons.email_outlined
                  ),
                  const SizedBox(height: 15,),
                  defaultButton(
                      function:(){
                        if(formKey.currentState!.validate())
                        {
                          cubit.updateUserData(
                              email: emailController.text,
                              phone: phoneController.text,
                              name: nameController.text
                          );
                          Navigator.pop(context);
                        }
                      },
                      text: 'save'.tr,
                      radius: 10,
                      background: defaultColor,
                      isUpperCase: true,
                      width: 200
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
