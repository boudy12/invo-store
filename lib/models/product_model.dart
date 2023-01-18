import 'package:flutter/cupertino.dart';

class ECommerceProductModel {

  String? message;
  int? count;
  List<ProductModel>? products = [];

  ECommerceProductModel.fromJson(Map<String,dynamic> json)
  {
    message = json['message'];
    count = json['count'];
    json['data'].forEach((element){
      products!.add(ProductModel.fromJson(element));
    });
  }
}




class ProductModel{
  int? id;
  String? name;
  String? description;
  dynamic discountedPrice;
  String? categoryId;
  dynamic price;
  String? img;

  ProductModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    img = json['img'];
    name = json['name'];
    description = json['description'];
    discountedPrice = json['discounted_price'];
    categoryId = json['category_id'];
  }
}


