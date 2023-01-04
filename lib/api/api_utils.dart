import 'package:dio/dio.dart';

ApiUtils apiUtils = ApiUtils();

class ApiUtils {
  final Dio _dio = Dio();

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> post({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }
}
