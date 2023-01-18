
import 'package:invostore1/models/user_model.dart';
import 'package:invostore1/models/user_register_model.dart';

abstract class ECommerceAppRegisterStates{}

class ECommerceAppRegisterInitialState extends ECommerceAppRegisterStates{}

class ECommerceAppRegisterLoadingState extends ECommerceAppRegisterStates{}

class ECommerceAppRegisterSuccessState extends ECommerceAppRegisterStates{

  final ECommerceAppUseRegisterModel eCommerceAppUseLoginModel;

  ECommerceAppRegisterSuccessState(this.eCommerceAppUseLoginModel);
}

class ECommerceAppRegisterErrorState extends ECommerceAppRegisterStates{
  final String error;
  ECommerceAppRegisterErrorState(this.error);
}



class ECommerceAppLoginShowPasswordRegisterState extends ECommerceAppRegisterStates{}

class ECommerceAppLoginShowPasswordConfirmState extends ECommerceAppRegisterStates{}
