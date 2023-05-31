import 'package:dio/dio.dart';

class DioService {
  final Dio _dio;

  DioService(this._dio);

  Future<Response> post(String path, Map<String, dynamic>? data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
