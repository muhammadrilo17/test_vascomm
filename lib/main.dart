import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:test_vascomm/di/app_component.dart';
// ignore: library_prefixes
import 'package:test_vascomm/core/utils/router.dart' as CustomRouter;
import 'package:test_vascomm/ui/pages/auth/login/cubit/login_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/login/cubit/password_visibility_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/login/login_page.dart';
import 'package:test_vascomm/ui/pages/auth/register/cubit/password_confirm_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/register/cubit/password_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/register/cubit/register_cubit.dart';
import 'package:test_vascomm/ui/pages/main/cubit/nav_drawer_cubit.dart';
import 'package:test_vascomm/ui/pages/main/cubit/navigation_drawer_cubit.dart';
import 'package:test_vascomm/ui/pages/main/home/cubit/home_cubit.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  AppComponent();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CustomRouter.Router _router;
  MyApp({super.key}) : _router = CustomRouter.Router();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<LoginCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<PasswordVisibilityCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<RegisterCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<PasswordCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<PasswordConfirmCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<NavigationDrawerCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<NavDrawerCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<HomeCubit>(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: _router.getRoute,
        navigatorObservers: [_router.routeObserver],
        home: LoginPage(),
      ),
    );
  }
}
