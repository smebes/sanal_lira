import 'package:flutter/material.dart';
import 'package:sanal_lira/core/route_names.dart';
import 'package:sanal_lira/screens/home_screen.dart';
import 'package:sanal_lira/screens/login_screen.dart';
import 'package:sanal_lira/screens/page_navigator.dart';
import 'package:sanal_lira/screens/splash_screen.dart';

class AppRouter {
  static const _appRouter = AppRouter._();

  const AppRouter._() : super();

  factory AppRouter.getInstance() {
    return _appRouter;
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.pageNavigator:
        return _route(
          () => const PageNavigator(),
        );
      case RouteNames.homeScreenRoute:
        return _route(
          () => const HomeScreen(),
        );

      case RouteNames.loginScreenRoute:
        return _route(
          () => const LoginScreen(),
        );

      // case RouteNames.registerScreenRoute:
      //   return _route(
      //     () => const RegisterScreen(),
      //   );

      default:
        return _route(
          () => const SplashScreen(),
        );
    }
  }

  Route _route(
    Widget Function() widget,
  ) {
    return MaterialPageRoute(
      builder: (
        BuildContext builderContext,
      ) {
        return widget();
      },
    );
  }
}
