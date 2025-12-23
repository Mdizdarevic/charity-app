import 'package:charity_app/domain/model/meme_template.dart';
import 'package:charity_app/presentation/create_meme/screen/create_meme_screen.dart';
import 'package:charity_app/presentation/meme_list/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoute {
  static const String homeScreen = '/';
  static const String createMemeScreen = '/create';

  AppRoute._();

  static Route<dynamic> generateRoute(BuildContext content, RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return _createAnimatedRoute(const HomeScreen());
      case createMemeScreen:
        final meme = settings.arguments as MemeTemplate;
        return PageTransition(
          type: PageTransitionType.fade,
          child: CreateMemeScreen(memeTemplate: meme),
          settings: settings,
        );
      default:
        throw Exception('Route not found...');
    }
  }

  static Route<dynamic> _createAnimatedRoute(Widget nextScreen) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) => nextScreen,
        transitionsBuilder: (context, animation, secondAnimation, child) {
          const begin = Offset(0, 1);
          const end = Offset(0, 0);
          const easeCurve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: easeCurve));

          return SlideTransition(position: animation.drive(tween), child: child);
        },
    );
  }
}