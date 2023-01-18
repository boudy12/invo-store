import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invostore1/models/user_model.dart';
import 'package:invostore1/modules/login/cubit/states.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/cubit.dart';
import 'package:invostore1/shared/network/remote/dio_helper.dart';

class ECommerceAppLoginCubit extends Cubit<ECommerceAppLoginStates>{

  ECommerceAppLoginCubit() : super(ECommerceAppLoginInitialState());

  static ECommerceAppLoginCubit get(context)=> BlocProvider.of(context);

 // late ECommerceAppUseLoginModel shopLoginModel;

  IconData suffix = Icons.remove_red_eye_outlined;
  bool isPasswordLogin = true;

  void changIconPasswordLoginState(){
    isPasswordLogin = !isPasswordLogin;
    suffix = isPasswordLogin? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
    emit(ECommerceAppLoginShowPasswordLoginState());
  }


  late ECommerceAppUseLoginModel eCommerceAppUseLoginModel ;
  void userLogin({
  required String email,
  required String password,
})
  {
    emit(ECommerceAppLoginLoadingState());
    DioHelper.postData(
        url: 'login',
        data: {
          'user':email,
          'password':password,
          'fb_token':"123456",
        },

    ).then((value) {
      eCommerceAppUseLoginModel = ECommerceAppUseLoginModel.fromJson(value.data);
      emit(ECommerceAppLoginSuccessState(eCommerceAppUseLoginModel));
    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppLoginErrorState(error.toString()));
    });
  }

  void printName(){
    showToast(
        msg:  eCommerceAppUseLoginModel.token!,
        state: ToastStates.SUCCESS
    );
  }

}