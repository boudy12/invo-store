import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';

class AddNewAddress extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var residentialUnitController = TextEditingController();
  var townController = TextEditingController();
  var stateController = TextEditingController();
  var addressController = TextEditingController();

  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          'addAddress'.tr,
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
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
                    controller: addressController,
                    type: TextInputType.streetAddress,
                    validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'streetAddress'.tr;
                      }
                      return null;
                    },
                    onTap: () {},
                    text: 'address'.tr,
                    prefixIcon:  Icons.traffic_outlined
                ),
                const SizedBox(height: 15,),
                defaultFormFieldWithStyle(
                    context: context,
                    controller: residentialUnitController,
                    type: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'TheResidentialUnitVerify'.tr;
                      }
                      return null;
                    },
                    onTap: () {},
                    text:  'TheResidentialUnit'.tr,
                    prefixIcon: Icons.house
                ),
                const SizedBox(height: 15,),
                defaultFormFieldWithStyle(
                    context: context,
                    controller: townController,
                    type: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'City/townVerify'.tr;
                      }
                      return null;
                    },
                    onTap: () {},
                    text:  'City/town'.tr,
                    prefixIcon: Icons.location_city
                ),
                const SizedBox(height: 15,),
                defaultFormFieldWithStyle(
                    context: context,
                    controller: stateController,
                    type: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'TheStateVerify'.tr;
                      }
                      return null;
                    },
                    onTap: () {},
                    text:  'theState'.tr,
                    prefixIcon: Icons.flag
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
                const SizedBox(height: 30,),

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
                    width: 200
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
