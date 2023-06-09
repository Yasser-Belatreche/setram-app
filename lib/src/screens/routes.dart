import 'package:flutter/material.dart';
import 'package:setram/src/screens/document/document.dart';
import 'package:setram/src/screens/home/home.dart';
import 'package:setram/src/screens/login/login.dart';
import 'package:setram/src/screens/notifications/notifications.dart';
import 'package:setram/src/screens/splash/splash.dart';

class Routes {
  static const String initialAuthenticated = "/home";

  static const String initialUnauthenticated = "/auth/login";

  static const String login = "/auth/login";

  static const String home = "/home";

  static const String document = "/document";

  static const String notifications = "/notifications";

  static const String splash = "/splash";
}

final Map<String, WidgetBuilder> routes = {
  Routes.login: (context) => const LoginScreen(),
  Routes.home: (context) => const HomeScreen(),
  Routes.document: (context) => const DocumentScreen(),
  Routes.notifications: (context) => const NotificationsScreen(),
  Routes.splash: (context) => const SplashScreen(),
};
