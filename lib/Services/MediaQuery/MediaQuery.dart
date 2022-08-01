import 'package:flutter/material.dart';

class M_Query {
  ///returns a percentage of the screen size (percentage, context, y-axis height or x-width>>).
  static double getpercentageScreedSize(
      double percentage, BuildContext context, String axis) {
    return axis == 'y'
        ? (percentage / 100) * (MediaQuery.of(context).size.height)
        : (percentage / 100) * (MediaQuery.of(context).size.width);
  }
}
