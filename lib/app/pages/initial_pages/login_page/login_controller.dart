import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_admin/app/api/auth/auth_service.dart';
import 'package:tedikap_admin/app/firebase/global_service.dart';
import 'package:tedikap_admin/common/themes.dart';
import '../../../../routes/AppPages.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final obsecureText = true.obs;
  RxBool isLoading = false.obs;
  late AuthService authenticationService;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    authenticationService = AuthService();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Login Error", "Please fill all fields",
          backgroundColor: red, colorText: white);
      return;
    }

    try {
      isLoading(true);
      final response = await authenticationService.login(
          email: emailController.text, password: passwordController.text, fcmToken: GlobalVariables.deviceToken);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['token']);
      Get.snackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.NAVBAR);
    } catch (e) {
      Get.snackbar("Login Error", "Invalid Username or Password",
          backgroundColor: red, colorText: white);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void toggle() {
    obsecureText.value = !obsecureText.value;
  }
}
