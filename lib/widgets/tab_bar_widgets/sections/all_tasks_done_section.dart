// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:things_to_do/models/task.dart';
import 'package:things_to_do/utils/colors.dart';

class AllTasksDoneSection extends StatelessWidget {
  AllTasksDoneSection(this.size, {Key? key}) : super(key: key);

  Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: size.height * 0.30,
            child: Image.asset(
              "assets/images/img2.png",
            ),
          ),
          const Text(
            "All Done For Now",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeColors.primaryColor,
            ),
          ),
          Text(
            "Next Task",
            style: TextStyle(
              fontSize: 16,
              color: ThemeColors.greyColor.withOpacity(0.6),
            ),
          ),
          Text(
            "Tomorrow 3:55 PM ",
            // TODO:
            // ${tasks[0].createdAt.day}",
            style: TextStyle(
              fontSize: 16,
              color: ThemeColors.greyColor.withOpacity(0.6),
            ),
          ),
          const Text(
            "Time for a Break",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
