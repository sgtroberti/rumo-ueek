import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rumo/features/onboarding/routes/onboarding_routes.dart';
import 'package:rumo/firebase_options.dart';
import 'package:rumo/routes/app_router.dart';
import 'package:rumo/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rumo',
      theme: AppTheme().theme,
      //home: OnboardingScreen(),
      routes: AppRouter.routes,
      initialRoute: OnboardingRoutes.onboardingScreen,
    );
  }
}
