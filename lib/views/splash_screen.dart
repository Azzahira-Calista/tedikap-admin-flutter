import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/splash_controller.dart';
import 'package:tedikap_admin/themes.dart';

class SplashAdmin extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              logoTedikap,
              width: 200,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
