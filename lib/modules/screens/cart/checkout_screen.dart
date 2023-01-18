import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/modules/screens/dialog/chechout_dialog.dart';
import 'package:invostore1/modules/screens/dialog/dialog.dart';
import 'package:invostore1/modules/screens/dialog/image_in_dialog.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';

class CheckoutScreen extends StatefulWidget {
   CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var phoneController = TextEditingController();
  var addressController = TextEditingController();
   String? payment =  "PaymentInCashUponReceipt".tr;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var model = ECommerceAppCubit.get(context).eCommerceAppProfileModel!.data;
        nameController.text = model!.name!;
        phoneController.text = model.phone!;
        var cubit = ECommerceAppCubit.get(context).eCommerceCartModel;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark1? Colors.black38 :Colors.grey[100],
                    ),
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => buildCheckOutItem(cubit!.items![index],context),
                        separatorBuilder:  (context, index) => SizedBox(height: 0,),
                        itemCount: cubit!.items!.length
                    ),
                  ),

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
                                  '${cubit.price}',
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
                                  '${cubit.total_price}',
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
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'contactInformation'.tr
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                            'paymentMethod'.tr
                        ),
                        RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Row(
                            children: [
                              Icon(
                                  Icons.money,
                                  color: isDark1? Colors.white:Colors.blueGrey
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "PaymentInCashUponReceipt".tr,
                                style: TextStyle(
                                    color: isDark1? Colors.white:Colors.blueGrey
                                ),
                              ),

                            ],
                          ),
                          value: "PaymentInCashUponReceipt".tr,
                          groupValue: payment,
                          onChanged: (value){
                            setState(() {
                              payment = value.toString();
                              print(payment);
                            });
                          },
                        ),
                        RadioListTile(

                          contentPadding: EdgeInsets.zero,
                          title: Row(
                            children: [
                              Icon(
                                  Icons.credit_card_outlined,
                                  color: isDark1? Colors.white:Colors.blueGrey
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "PaymentByCreditCardUponReceipt".tr,
                                style: TextStyle(
                                    color: isDark1? Colors.white:Colors.blueGrey
                                ),
                              ),
                            ],
                          ),
                          value: "PaymentByCreditCardUponReceipt".tr,
                          groupValue: payment,
                          onChanged: (value){
                            setState(() {
                              payment = value.toString();
                              print(payment);

                              showDialog(context: context,builder: (builder) =>CheckOutDialog(
                                text: 'afterCheckOutMessage'.tr,
                                widget: ECommerceLayoutScreen(),
                              ));
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                            'deliveryAddress'.tr
                        ),
                        SizedBox(
                          height: 10,
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
                            prefixIcon:  Icons.house_outlined
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
                  child: defaultButton(
                      text: 'completion'.tr,
                      function: (){
                        if(formKey.currentState!.validate())
                        {
                          ECommerceAppCubit.get(context).placeOrder(
                            payment_id: 1,
                            address: addressController.text,
                            customer_name: nameController.text,
                            customer_phone: phoneController.text,
                            total_price: ECommerceAppCubit.get(context).totalPrice,
                          );
                          showDialog(context: context,builder: (builder) =>CheckOutDialogScreen(
                            text: 'afterCheckOutMessage'.tr,
                            widget: ECommerceLayoutScreen(),
                          ));
                        }

                      },
                      width: double.infinity,
                      radius: 5,
                      background: defaultColor
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
