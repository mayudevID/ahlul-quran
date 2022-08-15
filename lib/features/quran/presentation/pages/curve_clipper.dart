import 'package:alquran_mobile_apps/core/utils/function.dart';
import 'package:flutter/cupertino.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
      size.width - ((45 / 210) * size.width),
      size.height / 2,
      size.width,
      0,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
