import 'package:get/get.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _simulateLoading();
  }

  void _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(Routes.SPLASH2);
  }
}

class Splash2Controller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _simulateLoading();
  }

  void _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAndToNamed(Routes.LOGIN);
  }
}
