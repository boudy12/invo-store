import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/models/search_model.dart';
import 'package:invostore1/modules/screens/search/cubit/states.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/network/remote/dio_helper.dart';

class ECommerceAppSearchCubit extends Cubit<ECommerceAppSearchStates> {
  ECommerceAppSearchCubit() : super(ECommerceAppSearchInitialStates());

  static ECommerceAppSearchCubit get(context) => BlocProvider.of(context);

  late ECommerceProductModel searchModel;


   void search({
     required String text ,
   }) {
     emit(ECommerceAppSearchLoadingStates());

     DioHelper.postData(
       url: 'product/search',
       token: token,
       data: {
         'q':text,
       },
     ).then((value) {
       searchModel = ECommerceProductModel.fromJson(value.data);
       emit(ECommerceAppSearchSuccessStates());

       print(searchModel.products!.length);
     }).catchError((error){
       print(error.toString());
       emit(ECommerceAppSearchErrorStates(error.toString()));
     });
   }
}