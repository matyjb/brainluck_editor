import 'package:flutter/material.dart';
import 'package:brainluck_editor/presentation/screens/home/home.dart';

class RouteNames {
  static const String home = "/home";
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => switch (settings.name) {
        RouteNames.home => const HomeScreen(),
        _ => const Scaffold(body: Text("404 route not found"))
      },
      settings: RouteSettings(arguments: settings.arguments),
    );
  }
}

