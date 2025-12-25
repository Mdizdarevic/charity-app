import 'package:flutter/material.dart';
import 'package:charity_app/presentation/auth/screen/sign_in_screen.dart';
import 'package:charity_app/presentation/auth/screen/splash_screen.dart';
import 'package:charity_app/presentation/charities/screen/home_screen.dart';
import 'package:charity_app/presentation/charity_search/screen/charity_search_screen.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String signInScreen = '/signIn';
  static const String homeScreen = '/home';
  static const String charitySearchScreen = '/charity-search';

  AppRouter._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case charitySearchScreen:
        return MaterialPageRoute(builder: (_) => const CharitySearchScreen());
      default:
        throw Exception("Route not found...");
    }
  }
}