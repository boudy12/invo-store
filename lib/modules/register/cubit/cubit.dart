import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invostore1/models/user_model.dart';
import 'package:invostore1/models/user_register_model.dart';
import 'package:invostore1/modules/register/cubit/states.dart';
import 'package:invostore1/shared/network/remote/dio_helper.dart';

class ECommerceAppRegisterCubit extends Cubit<ECommerceAppRegisterStates>{

  ECommerceAppRegisterCubit() : super(ECommerceAppRegisterInitialState());

  static ECommerceAppRegisterCubit get(context)=> BlocProvider.of(context);

 // ECommerceAppUseLoginModel? shopRegisterModel;

  IconData suffixRegister = Icons.remove_red_eye_outlined;
  IconData suffixConfirm = Icons.remove_red_eye_outlined;
  bool isPasswordRegister = true;
  bool isPasswordConfirm = true;

  void changIconPasswordRegisterState(){
    isPasswordRegister = !isPasswordRegister;
    suffixRegister = isPasswordRegister? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
    emit(ECommerceAppLoginShowPasswordRegisterState());
  }
  void changIconPasswordConfirmState(){
    isPasswordConfirm = !isPasswordConfirm;
    suffixConfirm = isPasswordConfirm? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
    emit(ECommerceAppLoginShowPasswordConfirmState());
  }

  late ECommerceAppUseRegisterModel eCommerceAppUseRegisterModel ;

  void userRegister({
  required String email,
  required String phone,
  required String password,
  required String confirmPassword,
  required String name,
})
  {
    emit(ECommerceAppRegisterLoadingState());
    DioHelper.postData(
        url: 'register',
        data: {
          'email':email,
          'phone':phone,
          'password':password,
          'name':name,
          'password_confirmation':confirmPassword,
          'fb_token':"123456",
        },
      lang: 'en'
    ).then((value) {
      eCommerceAppUseRegisterModel = ECommerceAppUseRegisterModel.fromJson(value.data);
      emit(ECommerceAppRegisterSuccessState(eCommerceAppUseRegisterModel));
      print(eCommerceAppUseRegisterModel.data!.email);
      print(eCommerceAppUseRegisterModel.data!.name);
    }).catchError((error){
      print(error.toString());
      emit(ECommerceAppRegisterErrorState(error.toString()));
    });
  }


}