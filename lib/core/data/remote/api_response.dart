class ApiResponse<T> {
  String? message;
  T? data;

  ApiResponse.success(this.data);
  ApiResponse.error(this.message);
}