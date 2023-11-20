import 'package:dio/dio.dart';
import 'package:food/core/Utils/function/cache_helper.dart';

class ApiService {
  final _baseUrl = 'https://student.valuxapps.com/api/';

  late final Dio dio;

  ApiService(this.dio);

  Future<Response> get({
    required String endPoint,
    required String lang,
  }) async {
    String? token = CacheHelper.getData(key: 'token');
    Response response = await dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'lang': lang,
          'Authorization': token ?? '',
        },
      ),
    );
    return response;
  }

  Future<Response> post({
    required String endPoint,
    required Map data,
    required String lang,
  }) async {
    String? token = CacheHelper.getData(key: 'token');
    Response response = await dio.post(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': token ?? '',
          'lang': lang,
        },
      ),
      data: data,
    );
    return response;
  }

  Future<Response> put({
    required String endPoint,
    required Map data,
    required String lang,
  }) async {
    String? token = CacheHelper.getData(key: 'token');
    Response response = await dio.put(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': token ?? '',
          'lang': lang,
        },
      ),
      data: data,
    );
    return response;
  }

  Future<Response> delete({
    required String endPoint,
    required Map data,
    required String lang,
  }) async {
    String? token = CacheHelper.getData(key: 'token');
    Response response = await dio.delete(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': token ?? '',
          'lang': lang,
        },
      ),
      data: data,
    );
    return response;
  }
}
