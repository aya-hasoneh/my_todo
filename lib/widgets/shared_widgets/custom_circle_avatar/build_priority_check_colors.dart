// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'custom_circle.dart';

class BuildPriorityCheckColors extends StatelessWidget {
  BuildPriorityCheckColors(
      {Key? key,
      required this.onTap,
      required this.color,
      this.isSelected = false})
      : super(key: key);

  void Function()? onTap;
  Color color;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 25,
      onPressed: onTap,
      child: CircleAvatar(
        backgroundColor: isSelected ? color.withOpacity(0.4) : color,
        radius: 10,
        child: BuildCustomCircle(
          radius: 8,
          color: color,
        ),
      ),
    );
  }
}
