// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BuildCustomCircle extends StatelessWidget {
  BuildCustomCircle(
      {Key? key, required this.color, this.radius = 10, this.child})
      : super(key: key);

  Color color;
  double? radius;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: radius,
      child: child,
    );
  }
}
