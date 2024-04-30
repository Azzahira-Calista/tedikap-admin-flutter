import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/splash_controller.dart';
import 'package:tedikap_admin/themes.dart';

class SplashTwo extends StatelessWidget {
  Splash2Controller splash2Controller = Get.put(Splash2Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primaryColor),
      
    );
  }
}
