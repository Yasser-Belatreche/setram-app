import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String? error;

  const ErrorMessage({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: error != null
          ? Text(
              error!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
    );
  }
}
