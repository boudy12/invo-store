class ECommerceAppFavModel{
  UserData? data;
  String? message;
  ECommerceAppFavModel.fromJson(Map<String,dynamic> json)
  {
    data = json['fav'] != null ? UserData.fromJson(json['fav']) : null;
    message = json['message'];
  }


}

class UserData{
  int? id;
  String? product_id;
  String? user_id;
  String? updated_at;
  String? created_at;




  UserData.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    product_id = json['product_id'];
    user_id = json['user_id'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];


  }
}