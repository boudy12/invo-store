class ECommerceAppUseRegisterModel{

  UserData? data;
  String? token;
  String? message;
  String? message1;
  int? code;
  ECommerceAppUseRegisterModel.fromJson(Map<String,dynamic> json)
  {

    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    token = json['token'];
    message = json['Message'];
    message1 = json['otp message'];
    code = json['verify code'];
  }


}
class UserData{
  int? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? fbToken;
  int? verified;
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
    verified = json['verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];


  }
}