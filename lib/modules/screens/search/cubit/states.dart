abstract class ECommerceAppSearchStates{}

class ECommerceAppSearchInitialStates extends ECommerceAppSearchStates{}

class ECommerceAppSearchLoadingStates extends ECommerceAppSearchStates{}

class ECommerceAppSearchSuccessStates extends ECommerceAppSearchStates{}

class ECommerceAppSearchErrorStates extends ECommerceAppSearchStates{

  final String error;
  ECommerceAppSearchErrorStates(
      this.error,
      );
}

