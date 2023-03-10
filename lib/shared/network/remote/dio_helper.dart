
import 'package:dio/dio.dart';

class DioHelper{

  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://fishss.invoacdmy.com/api/v1/',
        receiveDataWhenStatusError: true,

      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String? lang = 'en',
  })
  async
  {
    dio.options.headers = {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'lang':lang,
      'Authorization':token??'' ,
    };
    return await dio.get(url , queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token ,
    String? lang = 'en',
  })
  async
  {
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'' ,
    };
    return await dio.post(
        url ,
        queryParameters: query,
        data: data

    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
    String? lang = 'en',
  })
  async
  {
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'' ,
    };
    return await dio.put(
        url ,
        queryParameters: query,
        data: data
    );
  }

}

