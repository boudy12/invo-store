class ECommerceAppCleaningDataModel{

  String? message;
  int? count;
  List<CleaningData>? data = [];

  ECommerceAppCleaningDataModel.fromJson(Map<String,dynamic> json)
  {
    count = json['count'];
    message = json['message'];
    json['data'].forEach((element){
      data!.add(CleaningData.fromJson(element));
    });
  }


}
class CleaningData{
  String? name;
  String? price;
  int? id;
  String? category_id;



  CleaningData.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    price = json['price'];
    id = json['id'];
    category_id = json['category_id'];



  }
}