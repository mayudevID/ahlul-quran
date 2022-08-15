import 'package:flutter/material.dart';

class MyFunction {
  static double getHeight(BuildContext context, double getSize) {
    return MediaQuery.of(context).size.height * getSize / 812;
  }

  static double getWidth(BuildContext context, double getSize) {
    return MediaQuery.of(context).size.width * getSize / 374;
  }
}
