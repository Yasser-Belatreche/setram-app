import 'package:flutter/material.dart';
import 'package:setram/src/ui/loader.dart';

class LoginButton extends StatelessWidget {
  final bool loading;
  final Function() onPress;

  const LoginButton({Key? key, required this.loading, required this.onPress})
      : super(key: key);

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
      onPressed: onPress,
      child: !loading
          ? const Text(
              "Se connecter",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            )
          : const Loader(color: Colors.white, size: 20),
    );
  }
}
