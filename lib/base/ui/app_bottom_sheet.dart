import 'package:flutter/material.dart';

class AppBottomSheet {
  static void show(BuildContext context, Widget widget,
      {bool isDismissible = false, bool enableDrag = true, Function()? onCancelled, EdgeInsetsDirectional? bottomPadding}) {
    showModalBottomSheet<Widget>(
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height * 0.1,
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      isScrollControlled: true,
      elevation: 5,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => Padding(
        padding: bottomPadding ?? EdgeInsetsDirectional.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: widget,
      ),
    ).then((value) {
      onCancelled?.call();
    });
  }
}
