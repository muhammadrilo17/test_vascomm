import 'package:test_vascomm/core/data/resource.dart';
import 'package:test_vascomm/core/domain/repository/i_auth_repository.dart';
import 'package:test_vascomm/core/utils/payload/login_payload.dart';

class LoginUseCase {
  final IAuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Resource> login(LoginPayload payload) async {
    return await _repository.login(payload);
  }
}
