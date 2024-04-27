import 'package:get/get.dart';
import 'package:tedikap_admin/views/splash_screen_two.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _simulateLoading();
  }

  void _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => SplashTwo());
  }
}

class Splash2Controller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _simulateLoading();
  }

  void _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => ());
  }
}
