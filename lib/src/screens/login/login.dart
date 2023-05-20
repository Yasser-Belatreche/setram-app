import 'package:flutter/material.dart';
import 'package:setram/src/core/auth/api_contracts/login_body.dart';
import 'package:setram/src/core/auth/auth_service.dart';
import 'package:setram/src/screens/login/widgets/connection_text.dart';
import 'package:setram/src/screens/login/widgets/email_input.dart';
import 'package:setram/src/screens/login/widgets/error_message.dart';
import 'package:setram/src/screens/login/widgets/login_button.dart';
import 'package:setram/src/screens/login/widgets/password_input.dart';
import 'package:setram/src/screens/routes.dart';

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
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _error;
  bool _loading = false;

  Future<void> onLoginPress(BuildContext context) async {
    setState(() {
      _error = null;
      _loading = true;
    });

    try {
      await login(LoginBody(
        email: emailController.text,
        password: passwordController.text,
      ));

      Navigator.of(context).pushReplacementNamed(Routes.splash);
    } catch (e) {
      print(e);
      setState(() {
        _error = "Error Authentication";
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EmailInput(controller: emailController),
        const SizedBox(height: 20),
        PasswordInput(controller: passwordController),
        const SizedBox(height: 40),
        ErrorMessage(error: _error),
        const SizedBox(height: 10),
        LoginButton(
          loading: _loading,
          onPress: () => onLoginPress(context),
        ),
      ],
    );
  }
}
