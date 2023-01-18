class ECommerceAppAddRateModel{

  String? message;
  RateData? rates ;

  ECommerceAppAddRateModel.fromJson(Map<String,dynamic> json)
  {
    message = json['message'];
    rates = json['data'] != null ? RateData.fromJson(json['data']) : null;


  }


}
class RateData{
  int? userId;
  String? productId;
  int? id;
  String? scale;
  String? comment;
  String? userName;
  String? createdAt;
  String? updatedAt;



  RateData.fromJson(Map<String,dynamic> json)
  {
    userId = json['user_id'];
    productId = json['product_id'];
    id = json['id'];
    scale = json['scale'];
    comment = json['comment'];
    userName = json['user_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];


  }
}