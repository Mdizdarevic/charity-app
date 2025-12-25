import 'package:flutter/material.dart';
import 'package:charity_app/presentation/auth/screen/splash_screen.dart';
import 'package:charity_app/presentation/core/main_navigation_wrapper.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String mainWrapper = '/index';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case mainWrapper:
        return MaterialPageRoute(builder: (_) => const MainNavigationWrapper());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}