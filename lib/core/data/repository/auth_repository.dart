import 'package:test_vascomm/core/data/remote/dio_service.dart';
import 'package:test_vascomm/core/data/remote/remote_data_source.dart';
import 'package:test_vascomm/core/data/remote/response/login_response.dart';
import 'package:test_vascomm/core/data/resource.dart';
import 'package:test_vascomm/core/domain/repository/i_auth_repository.dart';
import 'package:test_vascomm/core/utils/payload/login_payload.dart';

class AuthRepository implements IAuthRepository {
  late RemoteDataSource _remoteDataSource;

  AuthRepository(DioService service) {
    _remoteDataSource = RemoteDataSource(service: service);
  }

  @override
  Future<Resource> login(LoginPayload payload) async {
    final result = await _remoteDataSource.login(payload);

    if (result.data != null) {
      final data = result.data as LoginResponse;
      if (data.token != '') {
        return Resource.success(true);
      }
    }

    return Resource.error(result.message);
  }
}
