import 'package:flutter/material.dart';
import 'package:charity_app/presentation/auth/screen/sign_in_screen.dart';
import 'package:charity_app/presentation/auth/screen/splash_screen.dart';
import 'package:charity_app/presentation/sights/screen/home_screen.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String signInScreen = '/signIn';
  static const String homeScreen = '/home';

  AppRouter._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        throw Exception("Route not found...");
    }
  }
}