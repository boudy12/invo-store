import 'package:invostore1/models/user_model.dart';

abstract class ECommerceAppStates{}

class ECommerceAppInitialState extends ECommerceAppStates{}

class ECommerceAppBottomNavBarState extends ECommerceAppStates{}
class ECommerceAppChangeRateState extends ECommerceAppStates{}

// ---------------- products ---------------------------

class ECommerceAppGetProductLoadingState extends ECommerceAppStates{}

class ECommerceAppGetProductSuccessState extends ECommerceAppStates{}

class ECommerceAppGetProductErrorState extends ECommerceAppStates{}


// ---------------- Categories ---------------------------

class ECommerceAppGetCategoriesLoadingState extends ECommerceAppStates{}

class ECommerceAppGetCategoriesSuccessState extends ECommerceAppStates{}

class ECommerceAppGetCategoriesErrorState extends ECommerceAppStates{}

// ---------------- SubCategories ---------------------------

class ECommerceAppGetSubCategoriesLoadingState extends ECommerceAppStates{}

class ECommerceAppGetSubCategoriesSuccessState extends ECommerceAppStates{}

class ECommerceAppGetSubCategoriesErrorState extends ECommerceAppStates{}

// ---------------- Profile ---------------------------

class ECommerceAppGetProfileLoadingState extends ECommerceAppStates{}

class ECommerceAppGetProfileSuccessState extends ECommerceAppStates{}

class ECommerceAppGetProfileErrorState extends ECommerceAppStates{}


class ECommerceAppUpdateProfileLoadingState extends ECommerceAppStates{}

class ECommerceAppUpdateProfileSuccessState extends ECommerceAppStates{}

class ECommerceAppUpdateProfileErrorState extends ECommerceAppStates{}


// ---------------- Rate ---------------------------

class ECommerceAppShowRateLoadingState extends ECommerceAppStates{}

class ECommerceAppShowRateSuccessState extends ECommerceAppStates{}

class ECommerceAppShowRateErrorState extends ECommerceAppStates{
  final String error;

  ECommerceAppShowRateErrorState(this.error);
}


class ECommerceAppAddRateLoadingState extends ECommerceAppStates{}

class ECommerceAppAddRateSuccessState extends ECommerceAppStates{}

class ECommerceAppAddRateErrorState extends ECommerceAppStates{
  final String error;

  ECommerceAppAddRateErrorState(this.error);
}

// ---------------- CleaningData ---------------------------

class ECommerceAppCleaningDataLoadingState extends ECommerceAppStates{}

class ECommerceAppCleaningDataSuccessState extends ECommerceAppStates{}

class ECommerceAppCleaningDataErrorState extends ECommerceAppStates{
  final String error;

  ECommerceAppCleaningDataErrorState(this.error);
}


// ---------------- Get User Data ---------------------------

class ECommerceAppLoadingUserDataState extends ECommerceAppStates{}

class ECommerceAppSuccessUserDataState extends ECommerceAppStates{
  final ECommerceAppUseLoginModel shopAppUseLoginModel;

  ECommerceAppSuccessUserDataState(this.shopAppUseLoginModel);
}

class ECommerceAppErrorUserDataState extends ECommerceAppStates{
  final String error;

  ECommerceAppErrorUserDataState(this.error);
}


// ---------------- Get Change Favorites ---------------------------


class ECommerceAppLoadingChangeFavState extends ECommerceAppStates{}

class ECommerceAppSuccessChangeFavState extends ECommerceAppStates{

}

class ECommerceAppErrorChangeFavState extends ECommerceAppStates{
  final String error;

  ECommerceAppErrorChangeFavState(this.error);
}

// ---------------- Get Favorites ---------------------------


class ECommerceAppLoadingFavoritesState extends ECommerceAppStates{}

class ECommerceAppSuccessFavoritesState extends ECommerceAppStates{}

class ECommerceAppErrorFavoritesState extends ECommerceAppStates{
  final String error;

  ECommerceAppErrorFavoritesState(this.error);
}

// ---------------- del Favorites ---------------------------


class ECommerceAppLoadingDeleteFavoritesState extends ECommerceAppStates{}

class ECommerceAppSuccessDeleteFavoritesState extends ECommerceAppStates{}

class ECommerceAppErrorDeleteFavoritesState extends ECommerceAppStates{
  final String error;

  ECommerceAppErrorDeleteFavoritesState(this.error);
}

// ---------------- add Favorites ---------------------------


class ECommerceAppLoadingAddFavoritesState extends ECommerceAppStates{}

class ECommerceAppSuccessAddFavoritesState extends ECommerceAppStates{}

class ECommerceAppErrorAddFavoritesState extends ECommerceAppStates{
  final String error;

  ECommerceAppErrorAddFavoritesState(this.error);
}

// ---------------- Place order ---------------------------


class ECommerceAppLoadingPlaceOrderState extends ECommerceAppStates{}

class ECommerceAppSuccessPlaceOrderState extends ECommerceAppStates{}

class ECommerceAppErrorPlaceOrderState extends ECommerceAppStates{
  final String error;

  ECommerceAppErrorPlaceOrderState(this.error);
}
// ---------------- Get Cart ---------------------------

class ShopAppLoadingCartsState extends ECommerceAppStates{}


class ShopAppSuccessCartsState extends ECommerceAppStates{}

class ShopAppErrorCartsState extends ECommerceAppStates{
  final String error;

  ShopAppErrorCartsState(this.error);
}

class ShopAppAddCartsLoadingState extends ECommerceAppStates{}
class ShopAppAddCartsSuccessState extends ECommerceAppStates{}
class ShopAppAddCartsErrorState extends ECommerceAppStates{}


class ShopAppDeleteCartsLoadingState extends ECommerceAppStates{}
class ShopAppDeleteCartsSuccessState extends ECommerceAppStates{}
class ShopAppDeleteCartsErrorState extends ECommerceAppStates{}

