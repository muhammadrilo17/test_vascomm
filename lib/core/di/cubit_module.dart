import 'package:get_it/get_it.dart';
import 'package:test_vascomm/ui/pages/auth/login/cubit/login_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/login/cubit/password_visibility_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/register/cubit/password_confirm_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/register/cubit/password_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/register/cubit/register_cubit.dart';
import 'package:test_vascomm/ui/pages/main/cubit/nav_drawer_cubit.dart';
import 'package:test_vascomm/ui/pages/main/cubit/navigation_drawer_cubit.dart';
import 'package:test_vascomm/ui/pages/main/home/cubit/home_cubit.dart';

class CubitModule {
  final di = GetIt.instance;
  void init() {
    di.registerSingleton<LoginCubit>(LoginCubit(di.get()));
    di.registerSingleton<PasswordVisibilityCubit>(PasswordVisibilityCubit());
    di.registerSingleton<RegisterCubit>(RegisterCubit());
    di.registerSingleton<PasswordCubit>(PasswordCubit());
    di.registerSingleton<PasswordConfirmCubit>(PasswordConfirmCubit());
    di.registerSingleton<NavigationDrawerCubit>(NavigationDrawerCubit());
    di.registerSingleton<NavDrawerCubit>(NavDrawerCubit());
    di.registerSingleton<HomeCubit>(HomeCubit());
  }
}
