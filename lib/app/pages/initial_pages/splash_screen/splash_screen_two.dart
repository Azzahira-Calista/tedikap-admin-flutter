// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_controller.dart';
import 'package:tedikap_admin/common/themes.dart';

class SplashTwo extends GetView<Splash2Controller>{
  Splash2Controller controller = Get.put(Splash2Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primaryColor),
      
      
    );
  }
}
