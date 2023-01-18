class ECommerceAppGetFavModel{

  String? message;
  List<ProductModelFav>? data = [];

  ECommerceAppGetFavModel.fromJson(Map<String,dynamic> json)
  {
    message = json['message'];
    json['data'].forEach((element){
      data!.add(ProductModelFav.fromJson(element));
    });
  }

}

class ProductModelFav{
  int? id;
  String? name;
  String? description;
  dynamic discountedPrice;
  String? categoryId;
  dynamic price;
  String? img;




  ProductModelFav.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    discountedPrice = json['discountedPrice'];
    categoryId = json['categoryId'];
    price = json['price'];
    img = json['img'];


  }
}