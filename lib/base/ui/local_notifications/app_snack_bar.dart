import 'package:demo_app/base/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class AppSnackBar {
  static show({required BuildContext context, required String message, Color? fontColor, Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: TextWidget(message, textColor: fontColor ?? Colors.white), backgroundColor: backgroundColor),
    );
  }
}
