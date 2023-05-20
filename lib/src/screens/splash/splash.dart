// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:setram/src/core/auth/auth_service.dart';
import 'package:setram/src/core/initialization.dart';
import 'package:setram/src/screens/routes.dart';
import 'package:setram/src/ui/loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> redirect(BuildContext context) async {
    if (await isLoggedIn()) {
      await initOnLaunch();
      Navigator.of(context).pushReplacementNamed(Routes.initialAuthenticated);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.initialUnauthenticated);
    }
  }

  @override
  Widget build(BuildContext context) {
    redirect(context);

    return const Scaffold(
      backgroundColor: Color.fromRGBO(242, 244, 255, 1),
      body: Center(
        child: Loader(size: 25),
      ),
    );
  }
}
