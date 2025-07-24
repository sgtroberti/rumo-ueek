import 'package:flutter/material.dart';
import 'package:rumo/features/home/screens/home_screen.dart';

class HomeRoutes {
  static const String home = '/home';

  static final Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomeScreen(),
  };
}
