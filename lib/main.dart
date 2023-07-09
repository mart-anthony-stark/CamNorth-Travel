import 'package:daex_travel_app/screens/homepage.dart';
import 'package:daex_travel_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel App",
      initialRoute: "/onboarding",
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HomePage.routeName: (context) => HomePage()
      },
    );
  }
}
