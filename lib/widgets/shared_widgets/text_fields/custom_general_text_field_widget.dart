// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '/utils/colors.dart';

class CustomGeneralTextFieldWidget extends StatelessWidget {
  String hintText;
  Widget? prefixIcon;
  TextEditingController? controller;
  bool obscureText;

  CustomGeneralTextFieldWidget({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autocorrect: false,
      style: const TextStyle(
        color: ThemeColors.greyColor,
      ),
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ThemeColors.lightGreyColor,
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
