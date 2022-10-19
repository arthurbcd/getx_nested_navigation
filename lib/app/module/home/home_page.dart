import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nested_navigation/app/dialog_module/dialog_page.dart';
import 'package:getx_nested_navigation/app/module/home/home_controller.dart';
import 'package:getx_nested_navigation/app/routes/app_pages.dart';
import 'package:getx_nested_navigation/app/widgets/app_dialog.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(tag: 'splash', child: FlutterLogo(size: 24 * 4)),
            ElevatedButton(
              onPressed: () => AppDialog.show(
                child: GetBuilder<DialogController>(
                  init: DialogController(),
                  builder: (_) => DialogPage(),
                ),
              ),
              child: Text('Open nested dialog'),
              // onPressed: () => Get.toNamed(AppRoutes.dialog.login),
              // text: 'Nested Teste em Dialog',
            ),
            ElevatedButton(
              // onPressed: () => AppDialog.show(child: DialogNest()),
              onPressed: () => Get.toNamed(AppRoutes.dialog),
              // text: 'Nested Teste em Tela',
              child: Text('Open nested page'),

            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: controller.onTheme,
        tooltip: 'Change Theme',
        child: const Icon(Icons.dark_mode),
      ),
    );
  }
}
