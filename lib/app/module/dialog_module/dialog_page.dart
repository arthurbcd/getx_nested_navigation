import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'dialog_page_one.dart';
// import 'dialog_page_two.dart';

///To call this page, just add in AppPages like any other page.
///
///ex:
///
// GetPage(
//       name: AppRoutes.dialog,
//       page: () => DialogPage(),
//       binding: DialogBinding(),
//       //When it's true, treats as temporary screen and animates from downToUp,
//       //also adds a CloseButton() to the appbar.
//       fullscreenDialog: true,
//     ),

class DialogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialogController>(
      () => DialogController(),
    );
  }
}

class DialogController extends GetxController {
  GetPageRoute onRoute(RouteSettings route) {
// Use any Get contextless navigation by just adding the subroute id:
    // Get.toNamed(DialogPage.one, id: DialogPage.id);
    // Get.back(id: DialogPage.id);
    if (route.name == DialogPage.two) {
      return GetPageRoute(routeName: DialogPage.two, page: () => DialogPage2());
    }
    // Add any other subroute here:
    // if (route.name == three) {
    //   return GetPageRoute(routeName: three, page: () => DialogPage3());
    // }
    return GetPageRoute(routeName: DialogPage.one, page: () => DialogPage1());
  }
}

class DialogPage extends GetWidget<DialogController> {
  //Add your unique subroute id here.
  static const id = 0;

  //Add all your named subroutes here.
  static const one = '/1';
  static const two = '/2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //The appbar stays always visible. Only the Scaffold.body will change.
      appBar: AppBar(title: Text('Nested Navigation !')),
      //Navigator will call and place the subpages here.
      body: Navigator(
          key: Get.nestedKey(id), onGenerateRoute: controller.onRoute),
    );
  }
}

class DialogPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('DialogPage2: Get.toNamed(SubPage.name, id: Page.id)'),
          onPressed: () => Get.toNamed(DialogPage.two, id: DialogPage.id),
        ),
      ),
    );
  }
}

class DialogPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('DialogPage1: Get.back(id: Page.id)'),
          onPressed: () => Get.back(id: DialogPage.id),
        ),
      ),
    );
  }
}
