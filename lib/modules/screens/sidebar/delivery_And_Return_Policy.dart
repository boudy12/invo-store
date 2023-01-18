import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/shared/components/components.dart';

class DeliveryAndReturnPolicy extends StatelessWidget {

  List<String> items=[
    'message1'.tr,
    'message2'.tr,
    'message3'.tr,
  ];
  List<String> items2=[
    'message4'.tr,
    'message5'.tr,
    'message6'.tr,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'deliveryAndReturnPolicy'.tr,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 40),
                child: buildPageItems(items,'deliveryPolicy'.tr),
              ),
              buildPageItems(items2,'returnPolicy'.tr),
            ],
          ),
        ),
      )
    );
  }
  Widget buildRowItems(String item)=>  Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: const CircleAvatar(
          radius: 3,
        ),
      ),
      SizedBox(
        width: 5,
      ),
      Expanded(
        child: Text(
          item,
          style: TextStyle(
              fontSize: 14
          ),
        ),
      ),
    ],
  );
  Widget buildPageItems(List<String> items,String title)=>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
      //  'deliveryPolicy'.tr,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      SizedBox(height: 20,),
      ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>buildRowItems(items[index]) ,
          separatorBuilder: (context, index) =>SizedBox(
            height: 15,
          ),
          itemCount: items.length
      ),
    ],
  );
}
