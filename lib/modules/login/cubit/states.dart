

import 'package:invostore1/models/user_model.dart';

abstract class ECommerceAppLoginStates{}

class ECommerceAppLoginInitialState extends ECommerceAppLoginStates{}

class ECommerceAppLoginLoadingState extends ECommerceAppLoginStates{}

class ECommerceAppLoginSuccessState extends ECommerceAppLoginStates{

  final ECommerceAppUseLoginModel eCommerceAppUseLoginModel;

  ECommerceAppLoginSuccessState(this.eCommerceAppUseLoginModel);
}

class ECommerceAppLoginErrorState extends ECommerceAppLoginStates{
  final String error;
  ECommerceAppLoginErrorState(this.error);
}

class ECommerceAppLoginShowPasswordLoginState extends ECommerceAppLoginStates{}
