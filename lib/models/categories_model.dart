import 'package:flutter/cupertino.dart';

class ECommerceCategoriesModel {

  String? message;
  int? count;
  List<CategoriesModel>? products = [];

  ECommerceCategoriesModel.fromJson(Map<String,dynamic> json)
  {
    message = json['message'];
    count = json['count'];
    json['data'].forEach((element){
      products!.add(CategoriesModel.fromJson(element));
    });
  }


}




class CategoriesModel{
  int? id;
  String? name;
  String? description;
  String? img;

  CategoriesModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    description = json['description'];

  }
}


