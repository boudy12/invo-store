import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/modules/screens/cart/carts_screen.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';

class CheckOutDialog extends StatelessWidget {
  var numberController = TextEditingController();
  var numberController2 = TextEditingController();
  var numberController3 = TextEditingController();
  late String text;
  var formKey = GlobalKey<FormState>();

  late Widget widget;

  CheckOutDialog({Key? key, required this.text, required this.widget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Container(
            width: double.maxFinite,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 4,
                      direction: Axis.horizontal,
                      runSpacing: 10,
                      children: [
                        Text('cardNumber'.tr),
                        _otpTextField(numberController, context, true, first: true),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Text('expiryDate'.tr),
                                    SizedBox(height: 10,),
                                    Container(
                                    width: double.infinity,
                                    child: _otpTextField(numberController2, context, false,
                                      second: true),
                                  ),
                              ],
                            )),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('CVV'),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: double.infinity,
                                      child: _otpTextField(
                                          numberController3, context, false,
                                          third: true),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                          decoration: BoxDecoration(
                            color: isDark1? Colors.black38 :Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(

                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'price'.tr,
                                    ),
                                    Spacer(),
                                    Text(
                                      '1420',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Text(
                                      'delivery'.tr,
                                    ),
                                    Spacer(),
                                    Text(
                                      '10',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),

                                  ],
                                ),
                                buildSpacerLine2(),
                                Row(
                                  children: [
                                    Text(
                                      'total'.tr,
                                    ),
                                    Spacer(),
                                    Text(
                                      '1430',
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          )
                      ),

                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: defaultButton(

                              isNonBackgroundColor: true,
                              text: 'cancel'.tr,
                              function: () {
                                Navigator.pop(context);

                              },
                              width: double.infinity,
                              radius: 10,
                              background: defaultColor,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: defaultButton(

                              text: 'confirm'.tr,
                              function: () {
                                navigateTo(context, ECommerceAppCartScreen());

                              },
                              width: double.infinity,
                              radius: 5,
                              background: defaultColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget _otpTextField(
      TextEditingController controller, BuildContext context, bool autoFocus,
      {bool? first = false, bool? second = false, bool? third = false}) {
    return Container(
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      width: first == true ? double.infinity : null,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: isDark1 ? defaultColor2 : Colors.white,
      ),
      child: AspectRatio(
        aspectRatio:1,
        child: TextField(
          controller: controller,
          autofocus: autoFocus,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType:
              second == true ? TextInputType.datetime : TextInputType.number,
          style: TextStyle(color: isDark1 ? Colors.white : Colors.blueGrey),
          maxLines: 1,
          onChanged: (value) {
            if (value.length == 16 && first == true) {
              FocusScope.of(context).nextFocus();
            } else if (value.length == 5 && second == true && (value.contains(':') || value.contains('/'))) {
              FocusScope.of(context).nextFocus();
            } else if (value.length == 3 && third == true) {
              FocusScope.of(context).nextFocus();
            } else if (value.length == 5 && second == true && (!value.contains(':') || !value.contains('/'))) {
              showDialog(context: context,builder: (builder) =>CheckOutDialog(
                text: 'afterCheckOutMessage'.tr,
                widget: ECommerceLayoutScreen(),
              ));
            }

          },
        ),
      ),
    );
  }
}
