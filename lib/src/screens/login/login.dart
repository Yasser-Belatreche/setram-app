import 'package:flutter/material.dart';

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
            children: <Widget>[
              const Text(
                "Connectez-vous à votre compte.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              const SizedBox(height: 50),
              const EmailInput(),
              const SizedBox(height: 20),
              const PasswordInput(),
              const SizedBox(height: 40),
              ElevatedButton(
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
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Email",
          style: TextStyle(
            color: Color(0xFF344054),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: 'exmaple@gmail.com',
            hintStyle: TextStyle(color: Color(0xFFE68C8C)),
            contentPadding: EdgeInsets.all(18),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD0D5DD), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD0D5DD), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Mot de pass",
          style: TextStyle(
            color: Color(0xFF344054),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          autocorrect: false,
          enableSuggestions: false,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "••••••••",
            contentPadding: EdgeInsets.all(18),
            hintStyle: TextStyle(color: Color(0xFFE68C8C)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD0D5DD), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD0D5DD), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            prefixIcon: Icon(Icons.lock_open, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
