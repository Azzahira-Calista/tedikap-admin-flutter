import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentPage = 0.obs;

   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (Get.arguments != null) {
      currentPage = Get.arguments;
    }
  }
}
