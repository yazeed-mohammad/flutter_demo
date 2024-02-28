import 'package:demo_app/base/constants/app_colors.dart';
import 'package:demo_app/base/constants/app_icons.dart';
import 'package:demo_app/base/constants/app_strings.dart';
import 'package:demo_app/base/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.title, this.body, this.onRetry});

  final String? title;
  final String? body;
  final Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        SvgPicture.asset(
          icError,
          width: (MediaQuery.sizeOf(context).width * 0.5),
        ),
        if (title != null) TextWidget(title!, textSize: 18, fontWeight: FontWeight.w700),
        const SizedBox(height: 8),
        if (body != null) TextWidget(body!, textSize: 16),
        const SizedBox(height: 16),
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: colorAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextWidget(retry, textColor: white),
          ),
          onTap: () => onRetry?.call(),
        ),
      ],
    );
  }
}
