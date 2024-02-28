import 'package:demo_app/base/constants/app_colors.dart';
import 'package:demo_app/base/methods/app_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.label,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense,
    this.obscureText = false,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.validator,
    this.margin,
  });

  final TextEditingController controller;
  final String? label;
  final InputBorder? border;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String? value)? validator;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onTapOutside: (point) => hideKeyboard(context),
        keyboardType: keyboardType,
        validator: (value) => validator?.call(value),
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          isDense: isDense,
          counter: const SizedBox.shrink(),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          labelStyle: TextStyle(color: grey500),
          border: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: primaryColor),
              ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: grey300, width: 1.5),
          ),
          focusedBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: primaryColor),
              ),
        ),
      ),
    );
  }
}
