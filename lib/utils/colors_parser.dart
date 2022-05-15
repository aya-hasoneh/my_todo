import 'package:flutter/material.dart';
import 'package:things_to_do/utils/colors.dart';

class ColorParser {
  static const List<Color> colorList = [
    ThemeColors.redColor,
    ThemeColors.orangeColor,
    ThemeColors.blueColor,
    ThemeColors.greenColor
  ];

  int takeColorAndReturnIndex(Color color) {
    for (var i = 0; i < colorList.length; i++) {
      if (colorList[i] == color) {
        return i;
      }
    }
    return 0;
  }
}
