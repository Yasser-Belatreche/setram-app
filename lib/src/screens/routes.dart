import 'package:flutter/material.dart';
import 'package:setram/src/screens/login/login.dart';

class Routes {
  static const String initialAuthenticated = "/home/principle";

  static const String initialUnauthenticated = "/auth/login";

  static const String login = "/auth/login";

  static const String home = "/home/principle";

  static const String documents = "/home/documents";

  static const String document = "/home/document";

  static const String profile = "/home/profile";

  static const String planning = "/home/planning";

  static const String notifications = "/home/notifications";
}

final Map<String, WidgetBuilder> routes = {
  Routes.login: (context) => const LoginScreen()
};
