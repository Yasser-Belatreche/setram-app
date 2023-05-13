import 'package:flutter/material.dart';
import 'package:setram/src/screens/routes.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: const Color(0xFF7F56D9),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        "Se connecter",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.home);
      },
    );
  }
}
