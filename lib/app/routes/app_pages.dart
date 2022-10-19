import 'package:get/get.dart';
import 'package:getx_nested_navigation/app/dialog_module/dialog_page.dart';
import 'package:getx_nested_navigation/app/module/home/home_binding.dart';
import 'package:getx_nested_navigation/app/module/home/home_page.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.dialog,
      page: () => DialogPage(),
      binding: DialogBinding(),
      //When it's true, treats as temporary screen and animates from downToUp,
      //also adds a CloseButton() to the appbar.
      fullscreenDialog: true,
    ),
  ];
}
