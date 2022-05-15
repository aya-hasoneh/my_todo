// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({Key? key,
  // required this.text,  required this.onChanged
  }) : super(key: key);
  // final String text;
  // void Function(String)? onChanged;

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    // final style = widget.text.isEmpty ? styleHint : styleActive;

    return TextField(
      onTap: () {},
      controller: controller,
      // onChanged: widget.onChanged,
      onChanged: (value){},
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/icons/search.png",
            scale: 3,
          ),
        ),
        fillColor: ThemeColors.whiteColor,
        filled: true,
        hintText: 'Search Task',
        hintStyle: const TextStyle(
          color: ThemeColors.lightGreyColor,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      style: const TextStyle(
        color: ThemeColors.blackColor,
      ),
    );
  }
}
