import 'package:flutter/material.dart';
import 'package:setram/src/screens/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'setram',
      theme: ThemeData(
        fontFamily: "Inter",
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splash,
      routes: routes,
    );
  }
}
