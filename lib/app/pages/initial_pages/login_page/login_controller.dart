import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_admin/app/api/auth/auth_service.dart';

import '../../../../routes/AppPages.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  RxBool isLoading = true.obs;
  late AuthService authenticationService;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    authenticationService = AuthService();
  }

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await authenticationService.login(
          email: emailController.text, password: passwordController.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      Get.snackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.NAVBAR);
    } catch (e) {
      isLoading(true);
      Get.snackbar("Login Error", "Invalid Username or Password");
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
