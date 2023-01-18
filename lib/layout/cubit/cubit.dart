import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/models/add_rate2_model.dart';
import 'package:invostore1/models/add_rate_model.dart';
import 'package:invostore1/models/brands.dart';
import 'package:invostore1/models/cart_model.dart';
import 'package:invostore1/models/categories_model.dart';
import 'package:invostore1/models/cleaning_method_model.dart';
import 'package:invostore1/models/get_fav_model.dart';
import 'package:invostore1/models/images.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/models/profile_model.dart';
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

class ECommerceAppCubit extends Cubit<ECommerceAppStates>{
  ECommerceAppCubit() : super(ECommerceAppInitialState());


  static ECommerceAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  int rate = 0;
  int totalPrice = 0;
  void changeRate(int index){
    rate = index;
    emit(ECommerceAppChangeRateState());
  }
  List<Widget> screen = [
    ECommerceAppProductScreen(),
    CategoriesScreen(),
    ECommerceAppFavScreen(),
    ECommerceAppCartScreen(),
  ];

  List<String> title = [
    'Home',
    'Categories',
    'Favorites',
    'Carts',
  ];

  List<ECommerceAppStates> states = [
    ECommerceAppGetProductLoadingState(),
    ECommerceAppGetProductSuccessState(),
    ECommerceAppGetProductErrorState(),
  ];

  List<int> counters = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  ];

  void changeCounterPlus(int index){
    counters[index] = counters[index]+1;

  }
  void changeCounterMinus(int index){
    if(counters[index]>0) {
      counters[index] = counters[index]-1;
    }

  }


  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index == 3 )
      {
        getCarts();
    //    getProduct();
      }
    emit(ECommerceAppBottomNavBarState());
  }

  ECommerceProductModel? eCommerceProductModel ;



  void getProduct() {
    emit(ECommerceAppGetProductLoadingState());
    DioHelper.getData(
      url: 'product/index',
    ).then((value) {

      eCommerceProductModel = ECommerceProductModel.fromJson(value.data);

      emit(ECommerceAppGetProductSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppGetProductErrorState());
    });
  }


  ECommerceAppShowRateModel? addRateMode;
  ECommerceAppAddRateModel? addRateMode1;
  void addRate({
  required int id,
}){
    emit(ECommerceAppShowRateLoadingState());

    DioHelper.getData(
      url: 'rates/ratesperproduct/$id',
      token: token,

    ).then((value) {

        addRateMode = ECommerceAppShowRateModel.fromJson(value.data);
        print(addRateMode!.rates![0].scale!);
        //rate = int.parse(addRateMode!.rates![0].scale!);
        emit(ECommerceAppShowRateSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppShowRateErrorState(error.toString()));
    });

  }

  void addRate1({
    required int product_id,
    required int scale,
    required String comment,
  }){
    emit(ECommerceAppAddRateLoadingState());

    DioHelper.postData(
      url: 'rates/add',
      token: CacheHelper.getData(key: 'token'),
      data: {
        'product_id':product_id,
        'scale':scale,
        'comment':comment,
    },

    ).then((value) {
      if(value.statusCode == 422){
        print('adfasdasd');
      }
          addRateMode1 = ECommerceAppAddRateModel.fromJson(value.data);
          print(addRateMode1!.rates!.productId!);
          //rate = int.parse(addRateMode!.rates![0].scale!);
          emit(ECommerceAppAddRateSuccessState());


      }).catchError((error){
      print(error.toString());
      emit(ECommerceAppAddRateErrorState(error.toString()));
    });

  }


  late bool isLike = false;

  Map<int,bool>? favorites = {};

  void addFavItem(int productId,context){
    emit(ECommerceAppLoadingChangeFavState());

    AppCubit.get(context).insertToDatabase(
        userId: userId!,
        productId: productId
    ).then((value) {
      favorites!.addAll({
        productId : true
      });
      emit(ECommerceAppSuccessChangeFavState());
    }).catchError((error){
      emit(ECommerceAppErrorChangeFavState(error.toString()));

    });

  }



  ECommerceAppCleaningDataModel? eCommerceAppCleaningDataModel;

  ECommerceAppProfileModel? eCommerceAppProfileModel;
  ECommerceAppProfileModel? eCommerceAppUpdateProfileModel;

  List<String> CleaningMethod =['cleaning method'];
  void getAllCleaningMethod({
    required String id
  }){
    emit(ECommerceAppCleaningDataLoadingState());

    DioHelper.getData(
      url: 'cleaning/index/$id',
      token: token,

    ).then((value) {

      eCommerceAppCleaningDataModel = ECommerceAppCleaningDataModel.fromJson(value.data);
      print(eCommerceAppCleaningDataModel!.data![0].name);

      eCommerceAppCleaningDataModel!.data!.forEach((element) {
        if(!CleaningMethod.contains(element.name)) {
          CleaningMethod.add(element.name!);
        }
      });
      print(CleaningMethod);
      //rate = int.parse(addRateMode!.rates![0].scale!);
      emit(ECommerceAppCleaningDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppCleaningDataErrorState(error.toString()));
    });

  }



  void getUserData(){
    emit(ECommerceAppGetProfileLoadingState());
    DioHelper.getData(
        url: 'user/profile',
        token:'Bearer ' + CacheHelper.getData(key: 'token'),
        lang: isArabic1 ? 'ar' : 'en'
    ).then((value) {
      if(value.statusCode==201) {
        eCommerceAppProfileModel = ECommerceAppProfileModel.fromJson(value.data);
        emit(ECommerceAppGetProfileSuccessState());

      }
      else
        {
          print(value.statusCode);

        }

    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppGetProfileErrorState());
    });
  }

  void updateUserData({
    required String email,
    required String name,
    required String phone,
  })
  {
    emit(ECommerceAppUpdateProfileLoadingState());
    DioHelper.postData(
      url: 'user/updateprofile',
      token:'Bearer ' + CacheHelper.getData(key: 'token'),
      lang: isArabic1 ? 'ar' : 'en',
      data: {
        'name':name,
        'email':email,
        'phone':phone,
      },

    ).then((value) {
      eCommerceAppProfileModel = ECommerceAppProfileModel.fromJson(value.data);
      emit(ECommerceAppUpdateProfileSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppUpdateProfileErrorState());
    });
  }



  ECommerceCartModel? eCommerceCartModel;

  void getCarts() async
  {
    emit(ShopAppLoadingCartsState());

    await DioHelper.getData(
      url: 'cart/user/index',
      token:'Bearer ' + CacheHelper.getData(key: 'token'),
      lang: isArabic1 ? 'ar' : 'en',
    ).then((value) {
      eCommerceCartModel = ECommerceCartModel.fromJson(value.data);
      totalPrice =  eCommerceCartModel!.total_price!+10;
      print(totalPrice);
      emit(ShopAppSuccessCartsState());
    }).catchError((error){
      print(error.toString());
      emit(ShopAppErrorCartsState(error.toString()));

    });
  }

  void addToCart({
    required int product_id,
    required String cleaning_id,
  })
  {
    emit(ShopAppAddCartsLoadingState());
    DioHelper.postData(
      url: 'cart/user/store',
      token:'Bearer ' + CacheHelper.getData(key: 'token'),
      lang: isArabic1 ? 'ar' : 'en',
      data: {
        'product_id':product_id,
        'cleaning_id':cleaning_id,
        'quantity':1,
      },

    ).then((value) {
      emit(ShopAppAddCartsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopAppAddCartsErrorState());
    });
  }
  ECommerceCategoriesModel? eCommerceCategoriesModel;

  void getCategories() {
    emit(ECommerceAppGetCategoriesLoadingState());
    DioHelper.getData(
      url: 'categories/index',
    ).then((value) {

      eCommerceCategoriesModel = ECommerceCategoriesModel.fromJson(value.data);

      emit(ECommerceAppGetCategoriesSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppGetCategoriesErrorState());
    });
  }
  ECommerceProductModel? eCommerceSubCategoryModel ;

  void getSubCategory({
    required int id
  }){
    emit(ECommerceAppGetSubCategoriesLoadingState());

    DioHelper.getData(
      url: 'product/category/$id',
      token: token,

    ).then((value) {

      eCommerceSubCategoryModel = ECommerceProductModel.fromJson(value.data);
      //rate = int.parse(addRateMode!.rates![0].scale!);
      emit(ECommerceAppGetSubCategoriesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppGetSubCategoriesErrorState());
    });

  }


  void deleteFromCard({
    required int id,
  })
  {
    emit(ShopAppDeleteCartsLoadingState());
    DioHelper.postData(
      url: 'cart/user/delete/$id',
      token:'Bearer ' + CacheHelper.getData(key: 'token'),
      lang: isArabic1 ? 'ar' : 'en',
      data: {},

    ).then((value) {
      getCarts();
      emit(ShopAppDeleteCartsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopAppDeleteCartsErrorState());
    });
  }


  void addToFav({
    required int id,
  })
  {
    emit(ECommerceAppLoadingAddFavoritesState());
    DioHelper.postData(
      url: 'favorite/add',
      token:'Bearer ' + CacheHelper.getData(key: 'token'),
      lang: isArabic1 ? 'ar' : 'en',
      data: {
        'product_id':id
      },

    ).then((value) {
      if(value.statusCode==201)
        {
          getFav();
          emit(ECommerceAppSuccessAddFavoritesState());

        }
      if(value.statusCode==422)
      {
        var string = value.data.toString();
        print(string);
      }

      }).catchError((error){
      print(error.toString());
      emit(ECommerceAppErrorAddFavoritesState(error.toString()));
    });
  }


  ECommerceAppGetFavModel? eCommerceAppGetFavModel;

  void getFav()
  {
    emit(ECommerceAppLoadingFavoritesState());
    DioHelper.postData(
      url: 'favorite/index',
      token:'Bearer ' + CacheHelper.getData(key: 'token'),
      lang: isArabic1 ? 'ar' : 'en',
      data: {},

    ).then((value) {
      eCommerceAppGetFavModel = ECommerceAppGetFavModel.fromJson(value.data);
      emit(ECommerceAppSuccessFavoritesState());
    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppErrorFavoritesState(error.toString()));
    });
  }



  void deleteFromFav({
    required int id,
  })
  {
    DioHelper.postData(
      url: 'favorite/delete/$id',
      token:'Bearer ' + CacheHelper.getData(key: 'token'),
      lang: isArabic1 ? 'ar' : 'en',
      data: {},

    ).then((value) {
      getFav();
      emit(ECommerceAppSuccessDeleteFavoritesState());
    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppErrorDeleteFavoritesState(error.toString()));
    });
  }



  void placeOrder({
    required int payment_id,
    required String address,
    required String customer_name,
    required String customer_phone,
    required int total_price,
  })
  {
    DioHelper.postData(
      url: 'order/user/store',
      token:'Bearer ' + CacheHelper.getData(key: 'token'),
      lang: isArabic1 ? 'ar' : 'en',
      data: {
        'payment_id':payment_id,
        'address':address,
        'customer_name':customer_name,
        'customer_phone':customer_phone,
        'total_price':total_price,
        'notes':'boudyyyyyyyyyyy',
      },

    ).then((value) {
      emit(ECommerceAppSuccessPlaceOrderState());
    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppErrorPlaceOrderState(error.toString()));
    });
  }




}