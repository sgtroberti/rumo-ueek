import 'package:flutter/widgets.dart';
import 'package:rumo/features/explore/explore_screen.dart';

class ExploreRoutes {
  static const String exploreScreen = '/explore';

  static final Map<String, Widget Function(BuildContext)> routes = {
    exploreScreen: (context) => const ExploreScreen(),
  };
}
