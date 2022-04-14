import 'package:flutter/material.dart';
import 'package:ob_tj_day_one/screens/car_detail/car_detail_screen.dart';
import 'package:ob_tj_day_one/screens/car_list/car_list_screen.dart';
import 'package:ob_tj_day_one/screens/home/home_screen.dart';

class MyRoutes {
  static const String HOME_SCREEN = "/";
  static const String CAR_LIST_SCREEN = "/carList";
  static const String CAR_DETAIL = "/carDetail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => HomeScreen(), settings: settings);
      case CAR_LIST_SCREEN:
        return MaterialPageRoute(builder: (_) => CarListScreen(), settings: settings);
      case CAR_DETAIL:
        int index = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => CarDetailScreen(index: index));
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen(), settings: settings);
    }
  }
}