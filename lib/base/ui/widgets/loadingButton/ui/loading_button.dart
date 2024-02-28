import 'package:demo_app/base/constants/app_colors.dart';
import 'package:demo_app/base/ui/widgets/loadingButton/providers/loading_button_provider.dart';
import 'package:demo_app/base/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.radius,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.bgColor,
    this.textColor,
    this.textSize,
    this.fontWeight,
    this.usedProvider,
    this.enabled = true,
    this.initLoading = true,
  });

  final Function() onTap;
  final double? height;
  final double? width;
  final double? radius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? bgColor;
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final Function(LoadingButtonProvider provider)? usedProvider;
  final bool enabled;
  final bool initLoading;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoadingButtonProvider(),
      child: Consumer<LoadingButtonProvider>(
        builder: (context, provider, child) {
          if (usedProvider != null) usedProvider!(provider);
          return Container(
            height: height ?? kToolbarHeight,
            width: provider.isLoading ? kToolbarHeight : width,
            margin: margin,
            padding: padding,
            child: InkWell(
              onTap: !enabled
                  ? null
                  : provider.isLoading
                      ? null
                      : () {
                          if (initLoading) context.read<LoadingButtonProvider>().setLoading(!provider.isLoading);
                          onTap.call();
                        },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  color: provider.success == null
                      ? bgColor ?? primaryColor
                      : provider.success == true
                          ? primaryDarkColor
                          : red,
                  borderRadius: BorderRadius.circular(provider.isLoading ? 50 : radius ?? 20),
                ),
                child: Center(
                  child: provider.isLoading
                      ? const CircularProgressIndicator(color: white)
                      : TextWidget(
                          provider.msg ?? text,
                          fontWeight: fontWeight ?? FontWeight.w500,
                          textSize: textSize,
                          textColor: textColor ?? white,
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
