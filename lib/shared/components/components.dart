import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:invostore1/admin/modules/update_product/update_product_screen.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/models/brands.dart';
import 'package:invostore1/models/cart_model.dart';
import 'package:invostore1/models/categories_model.dart';
import 'package:invostore1/models/get_fav_model.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/modules/screens/cart/counter.dart';
import 'package:invostore1/modules/screens/dialog/cart_dialog.dart';
import 'package:invostore1/modules/screens/profile/profile_screen.dart';
import 'package:invostore1/modules/screens/show_product.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';
import 'package:like_button/like_button.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required String text,
  required Function function,
  bool? isNonBackgroundColor = false,
}) =>
    Container(
      width: width,
      height: 40,

      child: MaterialButton(
        onPressed: () => function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: isNonBackgroundColor ==true? defaultColor:Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: isNonBackgroundColor ==true? Border.all(
          color: background,
          width: 2
        ) : null,
        color: isNonBackgroundColor ==true? null :background,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String s)? onChanged,
  Function(String s)? onSubmit,
  bool isPasswordIcons = false,
  required String? Function(String? value) validate,
  required String text,
  Function()? onTap,
  required IconData prefixIcon,
  IconData? suffix,
  Function? prefixpress,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
      obscureText: isPasswordIcons,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () => prefixpress!(),
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );

Widget defaultFormFieldWithStyle({
  required TextEditingController controller,
  required TextInputType type,
  Function(String s)? onChanged,
  Function(String s)? onSubmit,
  bool isPasswordIcons = false,
  required String? Function(String? value) validate,
  required String text,
  Function()? onTap,
  IconData? prefixIcon,
  IconData? suffix,
  int? maxLines = 1,
  int? minLines = 1,
  Function? prefixpress,
  bool isClickable = true,
  context,
}) =>
    TextFormField(
      maxLines: maxLines,
      minLines:minLines ,
      textDirection: isArabic1? TextDirection.rtl : TextDirection.ltr,
      style: TextStyle(
        color: AppCubit.get(context).isDark ? Colors.white : Colors.blueGrey,

      ),
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
      obscureText: isPasswordIcons,
      cursorColor: defaultColor,
      decoration: InputDecoration(
        focusColor: defaultColor,
        hintText: text,
        hintStyle: TextStyle(
          color: AppCubit.get(context).isDark ? Colors.white : Colors.blueGrey,
        ),
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: defaultColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.redAccent,
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: defaultColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () => prefixpress!(),
                icon: Icon(
                  suffix,
                  color: defaultColor,
                ),
              )
            : null,
      ),
    );

Widget buildSpacerLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey,
      ),
    );
Widget buildSpacerLine2({bool isTop = false,bool isBottom = false,}) => Padding(
  padding: isTop ?  EdgeInsets.only(bottom: 12) : isTop && isBottom?  EdgeInsets.zero: EdgeInsets.symmetric(vertical: 12),
  child: Container(
    color: Colors.grey[300],
    width: double.infinity,
    height: 2,

  ),

);

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinishSS(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

void showToast({
  required String msg,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: chooseToastColor(state),
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        textColor: Colors.white,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERROR:
      color = Colors.redAccent;
      break;

    case ToastStates.WARNING:
      color = Colors.amberAccent;
      break;
  }
  return color;
}

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title = '',
  List<Widget>? actions,
}) =>
    AppBar(
      titleSpacing: 5.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          isArabic1 ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
        ),
      ),
      actions: [
        IconButton(
            onPressed: (){
              navigateTo(context, ECommerceLayoutScreen(isCart: true,));
            },
            icon: Icon(
                Icons.shopping_cart_outlined
            )
        ),

        IconButton(
            onPressed: (){
              navigateTo(context, ProfileScreen());
            },
            icon: Icon(
                Icons.person_outline_sharp
            )
        ),
      ],
      title: Center(
        child: Text(
      title!,
      style: TextStyle(
          fontSize: 16
      ),
    ),
      ),

    );

Widget buildListItem(ProductModelFav favModel,context ,{bool? isFav = false,bool? isAdmin = false, int? value =1,int? index = 1 ,ProductModel? model,}) => InkWell(
  onTap: () { },
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            clipBehavior: Clip.antiAlias,
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child:  Image(
              image: NetworkImage(
                favModel.img!,
              ),
              height: 200,

            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Text(
                        favModel.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      if(isAdmin == false)
                        isFav == true?
                        InkWell(
                            onTap: (){
                              ECommerceAppCubit.get(context).deleteFromFav(id: favModel.id!);
                            },
                            child: Icon(
                              Icons.favorite,
                              size: 26,
                              color: Colors.redAccent,
                            )
                        )
                            :
                        InkWell(
                          onTap:  (){
                          },
                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.redAccent,
                          )
                      ),
                    ],
                  ),
                ),
                Text(
                  favModel.description!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Text(
                        favModel.price!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: defaultColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Spacer(),
                      isFav != true? CounterScreen(index: index,): Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);


Widget buildListCartItem(context ,{bool? isFav = false,bool? isAdmin = false, int? value =1,int? index = 1 ,ProductModel? model,CartProductModel? cartModel}) => InkWell(
  onTap: () {

  },
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            clipBehavior: Clip.antiAlias,
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child:  Image(
              image: NetworkImage(
                  cartModel!.product_img!
              ),
              height: 200,

            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Text(
                        cartModel.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      if(isAdmin == false)
                        isFav == true?
                        LikeButton(
                          isLiked: ECommerceAppCubit.get(context).isLike,
                          likeBuilder: (isLiked) {
                            final color = isLiked ? Colors.red : Colors.grey;

                            return Icon(
                              Icons.favorite,
                              color: color,
                            );
                          },
                          size: 25,
                          onTap: (isLiked) async {
                            return !ECommerceAppCubit.get(context).isLike;
                          },
                        )
                            :
                        InkWell(
                            onTap:  (){
                              ECommerceAppCubit.get(context).deleteFromCard(id: cartModel.id!);
                            },
                            child: Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.redAccent,
                            )
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Text(
                        '${cartModel.product_price}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: defaultColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Spacer(),
                      isFav != true? Text('Quantity : ${cartModel.quantity!}'): Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

Widget buildCategoriesItems(CategoriesModel model,int index , context) => Container(
      decoration: BoxDecoration(
        color: AppCubit.get(context).isDark
            ? defaultColor2
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Image(
                height: 60,
                width: 50,
                image: NetworkImage(
                  model.img!
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                model.name!,
              ),
            ],
          ),
        ),
      ),
    );

Widget buildGridProduct(ProductModel model,context,{bool? isAdmin = false}) => InkWell(
      onTap: () {
        navigateTo(
          context,
          ShowProductScreen(isAdmin:isAdmin,model: model, ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppCubit.get(context).isDark
              ? defaultColor2
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image(
                    image: NetworkImage(
                      model.img!
                    ),
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: CircleAvatar(
                  //     radius: 17,
                  //     backgroundColor: Colors.white10,
                  //     // child: IconButton(
                  //     //     onPressed: () {
                  //     //       ECommerceAppCubit.get(context).addFavItem(model.id,context);
                  //     //     },
                  //     //     icon: const Icon(
                  //     //       IconBroken.Heart,
                  //     //       size: 20,
                  //     //       color: defaultColor,
                  //     //     )
                  //     // ),
                  //     child: LikeButton(
                  //       isLiked: ECommerceAppCubit.get(context).isLike,
                  //       likeBuilder: (isLiked) {
                  //         final color = isLiked ? Colors.red : Colors.grey;
                  //         return Icon(
                  //           Icons.favorite,
                  //           color: color,
                  //         );
                  //       },
                  //       size: 25,
                  //       onTap: (isLiked) async {
                  //         return !ECommerceAppCubit.get(context).isLike;
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name!,
                    style: const TextStyle(
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Text(
                    "${model.price!}",
                    style:  TextStyle(
                      height: 1.5,
                      color: defaultColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: defaultColor,
                          width: 1
                        )
                      ),
                      child: InkWell(
                        onTap:  (){
                          isAdmin == true? navigateTo(context, UpdateProductScreen())
                              :
                          showDialog(context: context,builder: (builder) =>AddToCartDialog(
                            text: 'afterCheckOutMessage'.tr,
                            widget: ECommerceLayoutScreen(),
                            cleaning_id: model.categoryId!,
                            product_id: model.id!,
                          ));
                        },
                        child: Center(
                          child: Text(
                            isAdmin == true? 'update'.tr : 'addToCart'.tr,
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget buildBestSellerProduct(context, int index) => InkWell(
      onTap: () {},
      child: Container(
        width: 160,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(3, 3),
                  blurRadius: 3,
                  spreadRadius: -1),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 5),
                  blurRadius: 3,
                  spreadRadius: -1),
            ]),
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
              height: 180,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: const Image(
                image: NetworkImage(
                  'https://image.freepik.com/free-photo/picture-young-pretty-woman-model-pointing-opened-palm_114579-67123.jpg',
                ),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Image(
                      image: NetworkImage(
                        'https://image.freepik.com/free-photo/picture-young-pretty-woman-model-pointing-opened-palm_114579-67123.jpg',
                      ),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 180,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white10,
                        // child: IconButton(
                        //     onPressed: () {
                        //       ECommerceAppCubit.get(context).addFavItem(model.id,context);
                        //     },
                        //     icon: const Icon(
                        //       IconBroken.Heart,
                        //       size: 20,
                        //       color: defaultColor,
                        //     )
                        // ),
                        child: LikeButton(
                          isLiked: ECommerceAppCubit.get(context).isLike,
                          likeBuilder: (isLiked) {
                            final color = isLiked ? Colors.red : Colors.grey;
                            return Icon(
                              Icons.favorite,
                              color: color,
                            );
                          },
                          size: 25,
                          onTap: (isLiked) async {
                            return !ECommerceAppCubit.get(context).isLike;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );


Widget buildCheckOutItem(CartProductModel cartModel,context,{ProductModel? model}) => InkWell(
  onTap: () {
    navigateTo(
      context,
      ShowProductScreen(
        model: model!,
      )
    );
  },
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Expanded(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    cartModel.name!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  cartModel.cleaning_name!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${cartModel.product_price}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: defaultColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 130,
            clipBehavior: Clip.antiAlias,
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child:  Image(
              image: NetworkImage(
                  cartModel.product_img!,
              ),
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ),
  ),
);