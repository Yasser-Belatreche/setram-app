import 'package:flutter/material.dart';

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
              borderSide: BorderSide(color: Color(0xFFD0D5DD), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD0D5DD), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
