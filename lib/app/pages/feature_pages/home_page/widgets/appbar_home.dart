import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../../../common/constant.dart';

class AppBarHome extends GetView<HomeController> {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              logoTedikap,
              width: 55,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello 👋🏻",
                  style: appBarText,
                ),
                Text(
                  "Admin Tedikap",
                  style: normalText,
                ),
              ],
            ),
          ],
        ),
        InkWell(
            onTap: () {
              Get.toNamed(Routes.SCAN);
            },
            child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.SCAN);
                },
                child: Icon(
                  Icons.qr_code_scanner,
                  color: white,
                  size: 30,
                )))
      ],
    );
  }
}
