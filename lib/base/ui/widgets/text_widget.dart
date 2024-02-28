import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.style,
    this.textSize,
    this.textColor,
    this.fontWeight,
    this.align,
    this.textDirection,
    this.height,
    this.underline = false,
    this.overflow,
    this.maxLines,
    this.autoDirection = false,
  });

  final String text;
  final TextStyle? style;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final TextDirection? textDirection;
  final double? height;
  final bool underline;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool autoDirection;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? (autoDirection ? (isRTL(text) ? TextAlign.right : TextAlign.left) : null),
      maxLines: maxLines,
      textDirection: textDirection ?? (autoDirection ? (isRTL(text) ? TextDirection.rtl : TextDirection.ltr) : null),
      style: style ??
          TextStyle(
            fontSize: textSize,
            color: textColor,
            fontWeight: fontWeight,
            height: height,
            overflow: overflow,
            decoration: underline ? TextDecoration.underline : null,
          ),
    );
  }

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }
}
