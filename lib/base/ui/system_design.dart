import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

statusBarsColors({Color color = Colors.white}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: color,
      statusBarColor: color,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
