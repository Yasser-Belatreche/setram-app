import 'package:flutter/material.dart';

class ConnectionText extends StatelessWidget {
  const ConnectionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Connectez-vous à votre compte.",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }
}
