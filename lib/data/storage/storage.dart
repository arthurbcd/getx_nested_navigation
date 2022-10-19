import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageProvider extends GetxService {
  StorageProvider();
  final box = GetStorage();

  ///Recover the key-values saved in app cache.
  Future<void> init() async {
    await _initTheme();
    await _initAppSettings();
    await _initUserSettings();
  }

  ///Recover app theme.
  Future<void> _initTheme() async {
    await box.writeIfNull(_Key.darkTheme, false); //darkTheme = false;
    Get.changeThemeMode(
        box.read(_Key.darkTheme) ? ThemeMode.dark : ThemeMode.light);
  }

  ///Recover app settings.
  Future<void> _initAppSettings() async {}

  ///Recover user settings.
  Future<void> _initUserSettings() async {}

  // Theme
  void setTheme(bool v) => box.write(_Key.darkTheme, v);
}

class _Key {
  static const darkTheme = 'darkTheme';
}
