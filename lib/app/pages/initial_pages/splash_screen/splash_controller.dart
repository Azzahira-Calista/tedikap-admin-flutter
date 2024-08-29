import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  Future<void> onInit() async {
    super.onInit();
    final authToken = await SharedPreferences.getInstance().then((prefs) => prefs.getString('token'));
    if (authToken != null) {
      Get.offAndToNamed(Routes.NAVBAR);
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}



