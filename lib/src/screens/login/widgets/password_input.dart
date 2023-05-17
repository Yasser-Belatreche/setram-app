import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;

  const PasswordInput({Key? key, required this.controller}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Mot de pass",
          style: TextStyle(
            color: Color(0xFF344054),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: widget.controller,
          autocorrect: false,
          enableSuggestions: false,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "••••••••",
            contentPadding: EdgeInsets.all(18),
            hintStyle: TextStyle(color: Color(0xFFE68C8C)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD0D5DD), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD0D5DD), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            prefixIcon: Icon(Icons.lock_open, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
