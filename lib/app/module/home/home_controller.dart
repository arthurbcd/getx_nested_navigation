import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nested_navigation/app/routes/app_pages.dart';
import 'package:getx_nested_navigation/data/storage/storage.dart';

class HomeController extends GetxController {
  HomeController(this.storage);

  final StorageProvider storage;

  final _text = 'Login'.obs;
  String get text => _text.value;

  Future<void> onLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(AppRoutes.home);
  }

  ///Switches between dark and light mode.
  void onTheme() {
    storage.setTheme(!Get.isDarkMode);
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
