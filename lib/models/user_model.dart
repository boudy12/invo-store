class ECommerceAppUseLoginModel{

  UserData? data;
  String? token;
  String? message;
  ECommerceAppUseLoginModel.fromJson(Map<String,dynamic> json)
  {
    data = json['user'] != null ? UserData.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
  }


}
class UserData{
  int? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? fbToken;
  String? emailVerifiedAt;
  String? verified;
  String? createdAt;
  String? updatedAt;



  UserData.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    fbToken = json['fb_token'];
    emailVerifiedAt = json['email_verified_at'];
    verified = json['verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];


  }
}