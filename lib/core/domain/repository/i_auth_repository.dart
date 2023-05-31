import 'package:test_vascomm/core/data/resource.dart';
import 'package:test_vascomm/core/utils/payload/login_payload.dart';

abstract class IAuthRepository {
  Future<Resource> login(LoginPayload payload);
}