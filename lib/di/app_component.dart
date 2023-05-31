import 'package:get_it/get_it.dart';
import 'package:test_vascomm/core/di/cubit_module.dart';
import 'package:test_vascomm/core/di/network_module.dart';
import 'package:test_vascomm/core/di/repository_module.dart';
import 'package:test_vascomm/core/di/usecase_module.dart';

class AppComponent {
  static final AppComponent instance = AppComponent._();

  factory AppComponent() => instance;

  AppComponent._() {
    NetworkModule().init();
    RepositoryModule().init();
    UsecaseModule().init();
    CubitModule().init();
  }

  static Future<void> refresh() async {
    GetIt.I.reset(dispose: true);
    AppComponent._();
  }
}