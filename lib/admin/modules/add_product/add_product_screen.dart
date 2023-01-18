import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:invostore1/admin/layout/cubit/cubit.dart';
import 'package:invostore1/admin/layout/cubit/states.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';

class AddProductScreen extends StatefulWidget {
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var descriptionController = TextEditingController();

  var categoryController = TextEditingController();

  var priceController = TextEditingController();

  var prepareTimeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppAdminCubit, ECommerceAppAdminStates>(
      listener: (context, state) {},
      builder: (context, state) {
        dynamic profileImage = ECommerceAppAdminCubit.get(context).addImage;
        dynamic profilePic;
        var cubit = ECommerceAppAdminCubit.get(context);

        if (profileImage == null) {
          profilePic = AssetImage(
            'assets/Images/shrimp.png',
          );
        } else {
          profilePic = FileImage(profileImage);
        }
        return Form(
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
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              ),
                              image: DecorationImage(
                                image: profilePic,
                                fit: BoxFit.cover,
                              )),
                        ),
                        IconButton(
                            onPressed: () {
                              ECommerceAppAdminCubit.get(context)
                                  .getAddImage();
                            },
                            icon: const CircleAvatar(
                              radius: 20,
                              child: Icon(
                                IconBroken.Camera,
                                size: 18,
                              ),
                            )),
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
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'nameVerify'.tr;
                        }
                        return null;
                      },
                      onTap: () {},
                      text: 'name'.tr,
                      prefixIcon: Icons.fiber_manual_record_rounded),
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
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'priceVerify'.tr;
                              }
                              return null;
                            },
                            onTap: () {},
                            text: 'price'.tr,
                            prefixIcon: Icons.money_outlined),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: defaultFormFieldWithStyle(
                            context: context,
                            controller: prepareTimeController,
                            type: TextInputType.datetime,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'timeVerify'.tr;
                              }
                              return null;
                            },
                            onTap: () {},
                            text: 'time'.tr,
                            prefixIcon: Icons.timer_outlined),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: defaultColor, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton<String>(
                        dropdownColor:
                        isDark1 ? defaultColor2 : Colors.white,

                        isExpanded: true,
                        value: cubit.selectedCategory,
                        onChanged: (newValue) {
                          setState(() => cubit.selectedCategory = newValue!);

                        },
                        items: cubit.categories
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: isDark1
                                        ? Colors.white
                                        : Colors.blueGrey),
                              ),
                            ))
                            .toList(),

                        // add extra sugar..
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,

                        underline: SizedBox(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormFieldWithStyle(
                      maxLines: 5,
                      context: context,
                      controller: descriptionController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'descriptionVerify'.tr;
                        }
                        return null;
                      },
                      onTap: () {},
                      text: 'description'.tr,
                      prefixIcon: Icons.description),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: defaultColor, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButton<String>(
                            dropdownColor:
                                isDark1 ? defaultColor2 : Colors.white,

                            isExpanded: true,
                            value: cubit.selectedValue,
                            onChanged: (newValue) {
                              setState(() => cubit.selectedValue = newValue!);
                              cubit.saveData(code: newValue!);
                              print(cubit.idCode);
                            },
                            items: cubit.items
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: isDark1
                                                    ? Colors.white
                                                    : Colors.blueGrey),
                                          ),
                                        ))
                                .toList(),

                            // add extra sugar..
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,

                            underline: SizedBox(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        if(cubit.idCode!.length >0)
                          Text('cleaningMethod'.tr),
                          ListView.separated(
                            shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => buildCleaningItems(cubit.idCode![index]),
                              separatorBuilder: (context, index) => SizedBox(height: 10,),
                              itemCount: cubit.idCode!.length
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    text: 'save'.tr,
                    radius: 10,
                    background: defaultColor,
                    isUpperCase: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCleaningItems(String text) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              backgroundColor: defaultColor,
              radius: 5,
            ),
            SizedBox(
              width: 10,
            ),
            Text(text),
          ],
        ),
      );
}
