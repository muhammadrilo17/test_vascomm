import 'package:dio/dio.dart';
import 'package:test_vascomm/core/data/remote/api_response.dart';
import 'package:test_vascomm/core/data/remote/dio_service.dart';
import 'package:test_vascomm/core/data/remote/response/login_response.dart';
import 'package:test_vascomm/core/utils/endpoints.dart';
import 'package:test_vascomm/core/utils/payload/login_payload.dart';

class RemoteDataSource {
  final DioService service;

  RemoteDataSource({required this.service});

  Future<ApiResponse> login(LoginPayload payload) async {
    try {
      final response = await service.post(
        '/${Endpoints.login}',
        payload.toMap(),
      );

      if (response.statusCode == 200) {
        final LoginResponse result = LoginResponse.fromJson(
          response.data,
        );

        final apiResponse = ApiResponse.success(result);
        return apiResponse;
      }
      return ApiResponse.error(response.data['error']);
    } catch (e) {
      if (e is DioError) {
        return ApiResponse.error(e.response?.data['error']);
      }
      return ApiResponse.error(e.toString());
    }
  }
}
