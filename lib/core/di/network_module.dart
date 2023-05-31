import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:test_vascomm/core/data/remote/dio_service.dart';

class NetworkModule {
  static final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? '',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  )..interceptors.addAll(
      [
        LogInterceptor(requestBody: true, responseBody: true),
      ],
    );

  void init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = '';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError error, handler) {
          return handler.next(error);
        },
      ),
    );
    final di = GetIt.I;

    di.registerLazySingleton<DioService>(() => DioService(dio));
  }
}
