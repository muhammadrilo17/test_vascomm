import 'package:flutter/widgets.dart';
import 'package:test_vascomm/ui/pages.dart';
import 'package:test_vascomm/ui/pages/auth/login/login_page.dart';
import 'package:test_vascomm/ui/pages/auth/register/register_page.dart';
import 'package:test_vascomm/ui/pages/main/home/home_page.dart';

class Router {
  late RouteObserver<PageRoute> routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic>? getRoute(RouteSettings? settings) {
    switch (settings?.name) {
      case Pages.login:
        return _buildBackRoute(settings, LoginPage());
      case Pages.home:
        return _buildRoute(settings, HomePage());
      case Pages.register:
        return _buildRoute(settings, RegisterPage());
    }
    return null;
  }

  PageRouteBuilder _buildRoute(RouteSettings? settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: page,
            );
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  PageRouteBuilder _buildBackRoute(RouteSettings? settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: page,
            );
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
