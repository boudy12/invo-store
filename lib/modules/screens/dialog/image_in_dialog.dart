import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/styles/colors.dart';

class CheckOutDialogScreen extends StatelessWidget {

  late String text;

  late Widget widget;

  CheckOutDialogScreen({Key? key,required this.text,required this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),

        content:  Container(
          width: double.maxFinite,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.done_outlined,
                  size: 70,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
                child: defaultButton(
                    text: 'backToMain'.tr,
                    function: (){
                      navigateTo(context, widget);
                    },
                    width: double.infinity,
                    radius: 5,
                    background: defaultColor,

                ),
              )

            ],
          )
        )

    );
  }
}
