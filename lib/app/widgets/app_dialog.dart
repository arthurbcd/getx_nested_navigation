import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static void show({
    required Widget child,
    double height = 200.0,
    double width = 200.0,
    double radius = 24.0,
  }) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: (context.height / 2) - height,
              horizontal: (context.width / 2) - width,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(radius), child: child),
          );
        });
  }
}
