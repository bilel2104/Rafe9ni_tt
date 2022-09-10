import 'package:flutter/material.dart';
import 'package:rafe9ni/login/loginScreen.dart';
import 'package:rafe9ni/SplashScreen/splashScreen.dart';
import 'package:rafe9ni/home/MainScreen.dart';

class Routes {
  static const String splashRoute = "/";

  static const String loginRoute = "/login";

  static const String mainRoute = "/main";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('AppStrings.noRouteFound'),
              ),
              body: const Center(child: Text("AppStrings.noRouteFound")),
            ));
  }
}
