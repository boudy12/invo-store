import 'package:flutter/cupertino.dart';

class ECommerceCartModel {

  String? message;
  int? count;
  List<PaymentsModel>? payments = [];
  List<CartProductModel>? items = [];
  int? shippingPrice;
  int? total_price;
  int? price;

  ECommerceCartModel.fromJson(Map<String,dynamic> json)
  {
    message = json['message'];
    count = json['cart count'];
    shippingPrice = json['shipping price'];
    total_price = json['total_price'];
    price = json['price'];
    json['payments'].forEach((element){
      payments!.add(PaymentsModel.fromJson(element));
    });
    json['items  '].forEach((element){
      items!.add(CartProductModel.fromJson(element));
    });
  }


}

class PaymentsModel{

  int? id;
  String? name;


  PaymentsModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];


  }
}


class CartProductModel{

  int? id;
  String? name;
  String? cleaning_id;
  String? product_id;
  String? cleaning_name;
  String? product_price;
  String? product_img;
  String? quantity;
  String? user_id;
  CleaningModel? cleaning;

  CartProductModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    cleaning_id = json['cleaning_id'];
    product_id = json['product_id'];
    product_img = json['product_img'];
    name = json['name'];
    user_id = json['user_id'];
    quantity = json['quantity'];
    product_price = json['product_price'];
    cleaning_name = json['cleaning_name'];
    cleaning = json['cleaning'] != null ? CleaningModel.fromJson(json['cleaning']) : null;

  }
}


class CleaningModel{

  int? id;
  String? name_en;
  String? name_ar;
  String? price;
  String? category_id;
  String? product_price;
  String? updated_at;
  String? created_at;
  String? user_id;


  CleaningModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name_ar = json['name_ar'];
    price = json['price'];
    updated_at = json['updated_at'];
    name_en = json['name_en'];
    created_at = json['created_at'];
    category_id = json['category_id'];

  }
}