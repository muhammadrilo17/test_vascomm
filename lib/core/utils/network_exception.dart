import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;

  NetworkException.fromDioError(DioError error)
      : message = _handleError(error);

  static String _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return 'Request was cancelled';
      case DioErrorType.connectionTimeout:
        return 'Connection timeout, please try again later';
      case DioErrorType.receiveTimeout:
        return 'Receive timeout in connection';
      case DioErrorType.badResponse:
        return '${error.response?.statusCode}: ${error.response?.statusMessage}';
      case DioErrorType.sendTimeout:
        return 'Send timeout in connection';
      default:
        return 'Unexpected error occurred';
    }
  }

  @override
  String toString() => message;
}