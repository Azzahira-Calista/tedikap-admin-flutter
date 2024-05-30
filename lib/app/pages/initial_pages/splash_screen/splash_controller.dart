import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/initial_pages/login_page/login_admin.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_screen_two.dart';

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
    Get.off(() => LoginPage());
  }
}
