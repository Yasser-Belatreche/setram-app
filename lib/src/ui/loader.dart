import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  final Color color;
  final double size;

  const Loader({
    Key? key,
    this.color = const Color.fromARGB(255, 123, 0, 245),
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(color: color, size: size);
  }
}
