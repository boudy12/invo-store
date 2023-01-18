import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invostore1/admin/layout/cubit/states.dart';
import 'package:invostore1/admin/modules/add_product/add_product_screen.dart';
import 'package:invostore1/admin/modules/all_product/all_product_screen.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/models/brands.dart';
import 'package:invostore1/models/images.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/models/user_model.dart';
import 'package:invostore1/modules/login/cubit/cubit.dart';
import 'package:invostore1/modules/screens/cart/carts_screen.dart';
import 'package:invostore1/modules/screens/category/categories_screen.dart';
import 'package:invostore1/modules/screens/fav_screen.dart';
import 'package:invostore1/modules/screens/home/product_screen.dart';
import 'package:invostore1/modules/screens/setting_screen.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/shared/network/local/cache_helper.dart';
import 'package:invostore1/shared/network/remote/dio_helper.dart';
import 'package:invostore1/styles/icon_broken.dart';

class ECommerceAppAdminCubit extends Cubit<ECommerceAppAdminStates>{
  ECommerceAppAdminCubit() : super(ECommerceAppAdminInitialState());


  static ECommerceAppAdminCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<Widget> screen = [
    AllProductScreen(),
    AddProductScreen(),
    CategoriesScreen(isAdmin: true),
  ];

  List<String> title = [
    'ALL Product',
    'Add Product',
    'Categories',

  ];

  List<ECommerceAppStates> states = [
    ECommerceAppGetProductLoadingState(),
    ECommerceAppGetProductSuccessState(),
    ECommerceAppGetProductErrorState(),
  ];




  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index == 0 )
      {

      }
    emit(ECommerceAppAdminBottomNavBarState());
  }

  ECommerceProductModel? eCommerceProductModel ;



  void getProduct() {
    emit(ECommerceAppAdminGetProductLoadingState());
    print('form cubit 11111111111 $isArabic1');
    DioHelper.getData(
      url: 'allproducts',
      token: token,
      lang: isArabic1 ? 'ar' : 'en'
    ).then((value) {

      eCommerceProductModel = ECommerceProductModel.fromJson(value.data);

      emit(ECommerceAppAdminGetProductSuccessState());


    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppAdminGetProductErrorState());
    });
    // ignore: null_check_always_fails
  }

  File? updateImage;
  var picker = ImagePicker();
  Future<void> getUpdateImage() async
  {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile != null)
    {
      updateImage = File(pickedFile.path);
      emit(ECommerceAppAdminImagePickedGetSuccessState());
    }else{
      print("no image selected");
      emit(ECommerceAppAdminImagePickedGetErrorState());
    }

  }



  //
  // void uploadProfileImage({
  //   required String bio,
  //   required String phone,
  //   required String name,
  // }){
  //   emit(ECommerceAppAdminImagePickedUpdateLoadingState());
  //   firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child(
  //       'users/${Uri.file(updateImage!.path).pathSegments.last}'
  //   ).putFile(updateImage!)
  //       .then((value) {
  //     value.ref.getDownloadURL().then((value) {
  //       updateUserData(
  //         bio: bio,
  //         phone: phone,
  //         name: name,
  //         image: value,
  //       );
  //       //       emit(SocialAppUploadProfileImageSuccessState());
  //     }).catchError((error){
  //       emit(ECommerceAppAdminImagePickedUpdateErrorState());
  //     });
  //   })
  //       .catchError((error){
  //     emit(ECommerceAppAdminImagePickedUpdateErrorState());
  //   });
  // }

  File? addImage;
  Future<void> getAddImage() async
  {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile != null)
    {
      addImage = File(pickedFile.path);
      emit(ECommerceAppAdminImagePickedGetSuccessState());
    }else{
      print("no image selected");
      emit(ECommerceAppAdminImagePickedGetErrorState());
    }

  }



  //
  // void uploadProfileImage({
  //   required String bio,
  //   required String phone,
  //   required String name,
  // }){
  //   emit(ECommerceAppAdminImagePickedUpdateLoadingState());
  //   firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child(
  //       'users/${Uri.file(addImage!.path).pathSegments.last}'
  //   ).putFile(addImage!)
  //       .then((value) {
  //     value.ref.getDownloadURL().then((value) {
  //       updateUserData(
  //         bio: bio,
  //         phone: phone,
  //         name: name,
  //         image: value,
  //       );
  //       //       emit(SocialAppUploadProfileImageSuccessState());
  //     }).catchError((error){
  //       emit(ECommerceAppAdminImagePickedUpdateErrorState());
  //     });
  //   })
  //       .catchError((error){
  //     emit(ECommerceAppAdminImagePickedUpdateErrorState());
  //   });
  // }


  final items = ['cleaningMethod'.tr, 'way 1', 'way 2', 'way 3', 'way 4'];
  final categories = ['selectedCategory'.tr, 'category 1', 'category 2', 'category 3', 'category 4'];

  String selectedValue = 'cleaningMethod'.tr;
  String selectedCategory = 'selectedCategory'.tr;

  List<String>? idCode = [];
  void saveData({
    required String code,
  }) {

    if(!idCode!.contains(code) && code != 'cleaningMethod'.tr) {
      idCode!.addAll({code});
    }

    idCode!.toSet();
    idCode!.sort();
    }

  }






