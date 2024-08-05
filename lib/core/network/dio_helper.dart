
import 'package:dio/dio.dart';
import 'api_end_points.dart';

class DioHelper {
  static late Dio dio;

   static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30)
      ),
    );
  }

   Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {

     dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'text/plain',
    };
    return await dio.get(url, queryParameters: query,);
  }

   Future<Response> postData({
    required String url,
    dynamic query,
    dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'text/plain',
    };
    return await dio.post(url, queryParameters: query, data: data);

    // return ;
  }

   Future<Response> deleteData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'ar',
    String? token,
    String? contentType,
  }) async {
    dio.options.headers = {
      'Content-Type': contentType??'application/json',
      'Accept': 'text/plain',
    };
    return await dio.delete(url, queryParameters: query, data: data);
  }

   Future<Response> putData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'text/plain',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
