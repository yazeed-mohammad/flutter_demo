import 'package:demo_app/base/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.height, this.width, this.margin});

  final double height;
  final double? width;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        margin: margin ?? const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
