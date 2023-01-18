import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invostore1/modules/login/forget_password/confirm_number.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';

class ForgetPasswordScreen extends StatelessWidget {


  var formKey = GlobalKey<FormState>();
  var numberController = TextEditingController();


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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  'forgotYourPassword'.tr,
                  style: const TextStyle(
                      fontSize: 22
                  ),
                ),

                const SizedBox(
                  height: 60,
                ),
                defaultFormFieldWithStyle(
                    context: context,
                    controller: numberController,
                    type: TextInputType.number,
                    onTap: () {},
                    validate: (value){
                      if(value!.isEmpty)
                      {

                        return 'phoneVerify'.tr;
                      }
                      else if(value.length != 11)
                      {
                        return 'lessThan11'.tr;
                      }
                      return null;
                    },

                    text: 'phone'.tr,
                    prefixIcon: Icons.phone
                ),
                const SizedBox(
                  height: 15,
                ),

                const SizedBox(
                  height: 20,
                ),
                ConditionalBuilder(
                  condition: true,
                  builder: (context) => Center(
                    child: defaultButton(
                        function:(){
                          if(formKey.currentState!.validate())
                          {

                            navigateTo(context, ConfirmNumberScreen());
                          }
                        },
                        text: 'continuation'.tr,
                        radius: 10,
                        background: defaultColor,
                        isUpperCase: true,
                        width: 200
                    ),
                  ),
                  fallback: (context) => const Center(child: CircularProgressIndicator()),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
