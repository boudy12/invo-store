import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';
class ConfirmNumberScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var numberController = TextEditingController();
  var numberController2 = TextEditingController();
  var numberController3 = TextEditingController();
  var numberController4 = TextEditingController();
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
        child:Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'enterTheProcessingCode'.tr,
                  style: const TextStyle(
                      fontSize: 22
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'confirmNumberMessage'.tr,
                    style: const TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child:  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 4,
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    children: [
                      _otpTextField(context, true),
                      _otpTextField(context, false),
                      _otpTextField(context, false),
                      _otpTextField(context, false),
                      _otpTextField(context, false),

                    ],
                  ),
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

                          }
                        },
                        text: 'confirm'.tr,
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
  Widget _otpTextField(BuildContext context, bool autoFocus) {
    return  Container(
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: isDark1? defaultColor2 :Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: autoFocus,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: isDark1?Colors.white:Colors.blueGrey
          ),
          maxLines: 1,
          onChanged: (value) {
            if(value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
