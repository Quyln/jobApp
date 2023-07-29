import 'package:duanmoi/Components/tasks%20list/task_detailScreen.dart';
import 'package:duanmoi/Components/tasks%20list/task_class.dart';
import 'package:duanmoi/homepage.dart';
import 'package:duanmoi/profilescreen.dart';
import 'package:duanmoi/login_screen.dart';
import 'package:flutter/material.dart';

class Navigation {
  static const String login = '/login';
  static const String profile = '/profile';
  static const String home = '/home';
  static const String tb1 = '/notification';
  static const String detail = '/detailscreen';

  static Route<dynamic> getNavigation(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => SlashScreen());
      case profile:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case home:
        return MaterialPageRoute(builder: (context) => HomePage());

      case detail:
        return MaterialPageRoute(
            builder: (context) => DetailScreen(
                  item: settings.arguments as Task,
                ));
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}
