import 'package:flutter/material.dart';
import 'package:magic_solution_test/utils/app_constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final double textHeight;
  final double borderRadius;
  final Color borderColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry contentPadding;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final BoxDecoration? boxDecoration;
  final Color bgTextField;
  final IconButton? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText = false, // turn to ture if it password field
    required this.textStyle,
    required this.hintStyle,
    this.textHeight = 40,
    this.borderRadius = AppBorder.borderTextFieldLogin,
    this.borderColor = kBgLightGrayColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.controller,
    this.onChanged,
    this.boxDecoration,
    this.bgTextField = kBgLightGrayColor,
    this.suffixIcon, // Accept onChanged callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: boxDecoration,
        height: textHeight,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: bgTextField,
            hintText: hintText,
            hintStyle: hintStyle,
            contentPadding: contentPadding,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          style: textStyle,
        ),
      ),
    );
  }
}
