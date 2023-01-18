import 'package:invostore1/models/user_model.dart';

abstract class ECommerceAppAdminStates{}

class ECommerceAppAdminInitialState extends ECommerceAppAdminStates{}

class ECommerceAppAdminBottomNavBarState extends ECommerceAppAdminStates{}
class ECommerceAppAdminChangeRateState extends ECommerceAppAdminStates{}

// ---------------- products ---------------------------

class ECommerceAppAdminGetProductLoadingState extends ECommerceAppAdminStates{}

class ECommerceAppAdminGetProductSuccessState extends ECommerceAppAdminStates{}

class ECommerceAppAdminGetProductErrorState extends ECommerceAppAdminStates{}



// ---------------- Get User Data ---------------------------

class ECommerceAppAdminImagePickedUpdateLoadingState extends ECommerceAppAdminStates{}
class ECommerceAppAdminImagePickedUpdateErrorState extends ECommerceAppAdminStates{}

class ECommerceAppAdminImagePickedGetSuccessState extends ECommerceAppAdminStates{}
class ECommerceAppAdminImagePickedGetErrorState extends ECommerceAppAdminStates{}


// ---------------- Get User Data ---------------------------

class ECommerceAppAdminLoadingUserDataState extends ECommerceAppAdminStates{}

class ECommerceAppAdminSuccessUserDataState extends ECommerceAppAdminStates{
  final ECommerceAppAdminSuccessUserDataState shopAppUseLoginModel;

  ECommerceAppAdminSuccessUserDataState(this.shopAppUseLoginModel);
}

class ECommerceAppAdminErrorUserDataState extends ECommerceAppAdminStates{
  final String error;

  ECommerceAppAdminErrorUserDataState(this.error);
}


// ---------------- Get Change Favorites ---------------------------


class ECommerceAppAdminLoadingChangeFavState extends ECommerceAppAdminStates{}

class ECommerceAppAdminSuccessChangeFavState extends ECommerceAppAdminStates{

}

class ECommerceAppAdminErrorChangeFavState extends ECommerceAppAdminStates{
  final String error;

  ECommerceAppAdminErrorChangeFavState(this.error);
}

// ---------------- Get Favorites ---------------------------


class ECommerceAppAdminLoadingFavoritesState extends ECommerceAppAdminStates{}

class ECommerceAppAdminSuccessFavoritesState extends ECommerceAppAdminStates{}

class ECommerceAppAdminErrorFavoritesState extends ECommerceAppAdminStates{
  final String error;

  ECommerceAppAdminErrorFavoritesState(this.error);
}