import 'package:flutter/material.dart';
import 'package:setram/src/screens/login/widgets/connection_text.dart';
import 'package:setram/src/screens/login/widgets/email_input.dart';
import 'package:setram/src/screens/login/widgets/login_button.dart';
import 'package:setram/src/screens/login/widgets/password_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              ConnectionText(),
              SizedBox(height: 50),
              EmailInput(),
              SizedBox(height: 20),
              PasswordInput(),
              SizedBox(height: 40),
              LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
