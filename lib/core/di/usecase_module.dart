import 'package:get_it/get_it.dart';
import 'package:test_vascomm/core/domain/usecase/login_usecase.dart';

class UsecaseModule {
  final di = GetIt.instance;
  void init() {
    di.registerSingleton<LoginUseCase>(LoginUseCase(di.get()));
  }
}
