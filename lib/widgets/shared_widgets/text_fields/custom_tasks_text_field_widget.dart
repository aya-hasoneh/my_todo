// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '/utils/colors.dart';

class CustomTasksTextFieldWidget extends StatelessWidget {
  CustomTasksTextFieldWidget(
      {Key? key,
      this.text,
      this.title,
      this.hintStyle,
      this.onSubmitted,
      required this.controller})
      : super(key: key);

  String? text;
  String? title;
  TextStyle? hintStyle;
  TextEditingController? controller;
  void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Text(
                    title ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      color: ThemeColors.greyColor.withOpacity(0.6),
                    ),
                  ))
              : Container(),
          TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                fillColor: ThemeColors.whiteColor,
                filled: true,
                border: InputBorder.none,
                hintText: text,
                hintStyle: hintStyle ??
                    const TextStyle(
                      color: ThemeColors.lightGreyColor,
                      fontSize: 16,
                      overflow: TextOverflow.clip,
                    )),
          ),
          Divider(
            height: 0,
            color: Colors.grey.shade300,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
