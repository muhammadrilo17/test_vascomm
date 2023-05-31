import 'package:get_it/get_it.dart';
import 'package:test_vascomm/core/data/repository/auth_repository.dart';
import 'package:test_vascomm/core/domain/repository/i_auth_repository.dart';

class RepositoryModule {
  final di = GetIt.instance;
  void init() {
    di.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(di.get()),
    );
  }
}
