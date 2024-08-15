import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../../../common/constant.dart';

class AppBarHome extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
          Obx(
            () => Switch(
                activeColor: primaryColor,
                inactiveThumbColor: offColor,
                trackOutlineColor: MaterialStateProperty.all(white),
                value: controller.isSwitched.value,
                onChanged: (value) {
                  controller.toggeStoreStatus(value);
                }),
          )
          // InkWell(
          //     onTap: () {
          //       Get.toNamed(Routes.TAMBAH_NOTIF);
          //     },
          //     child: SvgPicture.asset(
          //       notifIcon,
          //       width: 36,
          //     ))
        ],
      ),
    );
  }
}
