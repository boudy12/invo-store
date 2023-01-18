class ECommerceAppShowRateModel{

  String? message;
  List<RateData>? rates = [];

  ECommerceAppShowRateModel.fromJson(Map<String,dynamic> json)
  {
    message = json['message'];
    json['data'].forEach((element){
      rates!.add(RateData.fromJson(element));
    });
  }


}
class RateData{
  String? userId;
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