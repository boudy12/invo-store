import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invostore1/styles/colors.dart';

class HighLightsScreen extends StatelessWidget {

  String first;
  String second;

  HighLightsScreen({Key? key,required this.first,required this.second}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
            child: Text(
              first.tr,
              style: const TextStyle(
                  fontSize: 20
              ),
            ),
          ),
          Container(
            decoration:  BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 2,
                      color: defaultColor
                  ),
                )
            ),
            child:  Text(
              second.tr,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    ); // cubit.e
  }
}
