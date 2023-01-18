import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/admin/modules/update_product/update_product_screen.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/models/add_rate2_model.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/modules/screens/dialog/cart_dialog.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';
import 'package:like_button/like_button.dart';

class ShowProductScreen extends StatefulWidget {
  bool? isAdmin = false;

  late ProductModel model;
  ShowProductScreen({Key? key, this.isAdmin,required this.model}) : super(key: key);

  @override
  State<ShowProductScreen> createState() =>
      _ShowProductScreenState(isAdmin: isAdmin,model: model);
}

class _ShowProductScreenState extends State<ShowProductScreen> {
  final items2 = ['weight'.tr, '1', '2', '3', '4'];
  var commentController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String selectedValue = 'cleaning method';
  String selectedValue2 = 'weight'.tr;
  var rate1 = 0;
  bool? isAdmin = false;
  late ProductModel model;
  _ShowProductScreenState({this.isAdmin,required this.model});
  @override
  void initState() {
    ECommerceAppCubit.get(context).addRate(id: model.id!);
    ECommerceAppCubit.get(context).getAllCleaningMethod(id: model.categoryId!);
    ECommerceAppCubit.get(context).CleaningMethod =['cleaning method'];
    print(model.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit, ECommerceAppStates>(
      listener: (context, state) {
        // if (state is ECommerceAppSuccessChangeFavState) {
        //   if (!state.changeFavModel.status) {
        //     showToast(
        //         msg: state.changeFavModel.message, state: ToastStates.ERROR);
        //   }
        // }
      },
      builder: (context, state) {
        return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
          listener: (context, state) {

          },
          builder:(context, state) {
            var cubit = ECommerceAppCubit.get(context);
            return Scaffold(
              appBar: isAdmin == true? AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    isArabic1 ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
                  ),
                ),
                title: Text(
                    'product'.tr
                ),
              ): defaultAppBar(context: context,),
              body: ConditionalBuilder(
                builder: (context) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image(
                            width: double.infinity,
                            image: NetworkImage(
                              model.img!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    model.name!,
                                    style: const TextStyle(fontSize: 22)),
                                Spacer(),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(onPressed: (){
                                        ECommerceAppCubit.get(context).addToFav(id: model.id!);
                                      }, icon: Icon(
                                        Icons.favorite_border_outlined,
                                        size: 26,
                                        color: Colors.redAccent,
                                      )),
                                    ),
                                    Text(
                                      "4.5",
                                    ),

                                    Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              model.price!,
                            ),
                            SizedBox(
                              height: 10,
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
                                  value: selectedValue,
                                  onChanged: (newValue) =>
                                      setState(() => selectedValue = newValue!),
                                  items: cubit.CleaningMethod
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
                            Row(
                              children: [
                                Text('cleaningValue'.tr),
                                Spacer(),
                                Text('20.00'),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30.0),
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: defaultColor, width: 2),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  dropdownColor:
                                  isDark1 ? defaultColor2 : Colors.white,
                                  value: selectedValue2,
                                  onChanged: (newValue) =>
                                      setState(() => selectedValue2 = newValue!),
                                  items: items2
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
                            Text(
                              'fullDescription'.tr,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'addReview'.tr,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => buildRateItems(
                                      index, ECommerceAppCubit.get(context).rate),
                                  separatorBuilder: (context, index) => SizedBox(
                                    width: 1,
                                  ),
                                  itemCount: 5),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: Material(
                                color: isDark1 ? defaultColor2 : Colors.white70,
                                elevation: 10.0,
                                child: Form(
                                  key: formKey,
                                  child: defaultFormFieldWithStyle(
                                      minLines: 3,
                                      maxLines: 5,
                                      context: context,
                                      controller: commentController,
                                      type: TextInputType.text,
                                      onTap: () {},
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'commentVerify'.tr;
                                        }
                                        return null;
                                      },
                                      text: 'comment'.tr,
                                      prefixIcon: Icons.comment),
                                ),
                              ),
                            ),
                            defaultButton(
                                text: 'addReview'.tr,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.addRate1(
                                      scale: 4,
                                      comment: commentController.text,
                                      product_id: model.id!
                                    );
                                  }
                                },
                                width: 180,
                                background: defaultColor)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => buildCommentItem(),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: 2),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: isAdmin == true
                              ? defaultButton(
                              function: () {
                                navigateTo(context, UpdateProductScreen());
                              },
                              text: 'update'.tr,
                              radius: 5,
                              background: defaultColor,
                              isUpperCase: false,
                              width: 250)
                              : defaultButton(
                              function: () {
                                showDialog(
                                    context: context,
                                    builder: (builder) => AddToCartDialog(
                                      product_id: model.id!,
                                      cleaning_id: model.categoryId!,
                                      text: 'afterCheckOutMessage'.tr,
                                      widget: ECommerceLayoutScreen(),
                                    ));
                              },
                              text: 'addToCart'.tr,
                              radius: 5,
                              background: defaultColor,
                              isUpperCase: false,
                              width: 250),
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) => Center(child: CircularProgressIndicator()),
                condition: state is! ECommerceAppShowRateLoadingState,
              ),
            );
          },

        );
      },
    );
  }

  Widget buildCommentItem() => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark1 ? Colors.black12 : Colors.grey[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Boudy',
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text('4.5'),
                      Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'fullDescription'.tr,
                style: TextStyle(height: 1.3),
              ),
            ],
          ),
        ),
      );
  Widget buildRateItems(var index1, var rate) {
    var index = index1 + 1;
    return IconButton(
      onPressed: () {
        ECommerceAppCubit.get(context).changeRate(index);
      },
      icon: Icon(
        index <= rate
            ? Icons.star
            : index > rate && rate > index - 1
                ? Icons.star_half_outlined
                : Icons.star_outline,
        size: 30,
      ),
    );
  }
}
