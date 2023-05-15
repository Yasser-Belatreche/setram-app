import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;

  const SvgIcon({Key? key, required this.path, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path, height: height, width: width);
  }
}
