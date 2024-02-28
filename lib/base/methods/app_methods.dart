import 'package:flutter/material.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
