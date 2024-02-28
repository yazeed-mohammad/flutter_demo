import 'package:demo_app/base/constants/app_colors.dart';
import 'package:demo_app/base/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.backgroundColor,
    required this.text,
    this.textColor,
    this.textSize,
    this.fontWeight,
    required this.onTap,
  });

  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: height ?? kToolbarHeight,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        child: Center(
          child: TextWidget(
            text,
            textColor: textColor,
            textSize: textSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
