import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/admin/layout/cubit/cubit.dart';
import 'package:invostore1/admin/layout/cubit/states.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';

class UpdateProductScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();
  var prepareTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppAdminCubit,ECommerceAppAdminStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        dynamic profileImage = ECommerceAppAdminCubit.get(context).updateImage;
        dynamic profilePic;


        if(profileImage == null)
        {
          profilePic= AssetImage(
            'assets/Images/shrimp.png',
          );

        } else{
          profilePic = FileImage(profileImage);
        }
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
                'update'.tr
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            height: 160,
                            width: double.infinity,
                            decoration:  BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: profilePic,
                                  fit: BoxFit.cover,

                                )
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                ECommerceAppAdminCubit.get(context).getUpdateImage();
                              },
                              icon: const CircleAvatar(
                                radius: 20,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 18,
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
                        prefixIcon: Icons.fiber_manual_record_rounded
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: defaultFormFieldWithStyle(
                              context: context,
                              controller: priceController,
                              type: TextInputType.number,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'priceVerify'.tr;
                                }
                                return null;
                              },
                              onTap: () {},
                              text:  'price'.tr,
                              prefixIcon: Icons.money_outlined
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: defaultFormFieldWithStyle(
                              context: context,
                              controller: prepareTimeController,
                              type: TextInputType.datetime,
                              validate: (value){
                                if(value!.isEmpty)
                                {
                                  return 'timeVerify'.tr;
                                }
                                return null;
                              },
                              onTap: () {},
                              text:  'time'.tr,
                              prefixIcon: Icons.timer_outlined
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormFieldWithStyle(
                      maxLines: 5,
                        context: context,
                        controller: descriptionController,
                        type: TextInputType.text,
                        validate: (value){
                          if(value!.isEmpty)
                          {
                            return 'descriptionVerify'.tr;
                          }
                          return null;
                        },
                        onTap: () {},
                        text:  'description'.tr,
                        prefixIcon: Icons.description
                    ),
                    SizedBox(height: 50,),
                    defaultButton(
                      function:(){
                        if(formKey.currentState!.validate())
                        {
                        }
                      },
                      text: 'save'.tr,
                      radius: 10,
                      background: defaultColor,
                      isUpperCase: true,
                    ),
                    SizedBox(height: 20,),
                    defaultButton(
                      function:(){

                      },
                      text: 'delete'.tr,
                      radius: 10,
                      background: Colors.redAccent,
                      isUpperCase: true,

                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    },
    );
  }
}
